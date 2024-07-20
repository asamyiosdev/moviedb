//
//  NetworkManager.swift
//  moviedb
//
//  Created by Ahmed samy on 17/07/2024.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case serializationError
    case noData
    case requestFailed(Error)
    case invalidResponse
    case customError(String)
}


enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

class ApiClient : ApiClientContract {
    
    
    init() {}
    
    
    func call( method: HTTPMethod,
               parameters: [String: Any]? = nil,
               webserviceType: String,
               success: @escaping (([String: Any]) -> Void),
               failed: @escaping (([String: Any]) -> Void)) {
        let url = ServerConfigurationsManager.sharedInstance.webservicesUrl + webserviceType
        
        var finalParameters: [String: Any] = getDefaultParameters()
        
        if let params = parameters {
            finalParameters.merge(dict: params)
        }
        
        request(urlString:url,
                method: method,
                parameters: finalParameters) { result in
            switch result {
            case .success(let data):
                // Handle the successful response data
                print("Data received: \(data)")
                
                // Example of parsing JSON response
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        print("JSON: \(json)")
                        let response = json as [String : Any]
                        success(response)
                        
                    }
                } catch {
                    print("Failed to parse JSON: \(error)")
                }
                
            case .failure(let error):
                // Handle the error
                var message = "Something error please try again"
                switch error {
                case .invalidURL:
                    message = "Invalid URL"
                case .serializationError:
                    message = "Failed to serialize request parameters"
                case .noData:
                    message = "No data received from server"
                case .requestFailed(let error):
                    message = "Request failed: \(error.localizedDescription)"
                    
                case .invalidResponse:
                    message = "Invalid response from server"
                case .customError(let errorMessage):
                    message = errorMessage
                }
                
                failed(["message":message])
            }
        }
    }
    
    
    
    func request(urlString: String,
                 method: HTTPMethod,
                 parameters: [String: Any]? = nil,
                 completion: @escaping (Result<Data, NetworkError>) -> Void) {
        // Validate URL
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            return
        }
        
        // Create URLRequest
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        // Set request body and headers for POST method
        if method == .post {
            if let parameters = parameters {
                do {
                    request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
                    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                } catch {
                    completion(.failure(.serializationError))
                    return
                }
            }
        } else if method == .get {
            if let query = convertParametersToQuery(parameters: parameters) {
                var urlComponents = URLComponents(string: urlString)
                urlComponents?.query = query
                
                if let url = urlComponents?.url {
                    request = URLRequest(url: url)
                }
            }
        }
        
        // Perform the network request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(.requestFailed(error)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            // Check response status code and handle response
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        print("JSON: \(json)")
                        let response = json as [String: Any]
                        let message = response.getString("status_message")
                        completion(.failure(.customError(message)))
                    }
                } catch {
                    completion(.failure(.serializationError))
                }
                
                return
            }
            
            completion(.success(data))
        }
        task.resume()
    }
    
    
    func convertParametersToQuery(parameters: [String: Any]?) -> String? {
        guard let parameters = parameters else { return nil }
        var components = URLComponents()
        components.queryItems = parameters.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
        return components.query?.removingPercentEncoding
    }
    
    func getDefaultParameters() -> [String: Any]{
        let queryItems = ["api_key": ServerConfigurationsManager.sharedInstance.apiKey ]
        return queryItems
    }
}


