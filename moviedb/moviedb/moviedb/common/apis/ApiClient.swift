//
//  NetworkManager.swift
//  moviedb
//
//  Created by Ahmed samy on 17/07/2024.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case requestFailed(Error)
    case invalidResponse
    case invalidData
    case timeOut
    case decodingError
    case networkError(Error)
    case noData
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

class ApiClient : ApiClientContract {
 
//    static let shared = ApiClient()

     init() {}
    

    func call(parameters: [String: Any]? = nil,
              webserviceType: String,
              success: @escaping (([String: Any]) -> Void),
              failed: @escaping (([String: Any]) -> Void)) {
        let url = ServerConfigurationsManager.sharedInstance.webservicesUrl + webserviceType
        
        let parameters: [String: Any] = getDefaultParameters()
        
        request(urlString: url,
                method: HTTPMethod.get,
                parameters: parameters,
                completion: { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            guard let data = data else {
                print("No data received")
                return
            }
            // Process the data
            if let json = try? JSONSerialization.jsonObject(with: data, options: []) {
                print(json)
                success(json as? [String : Any] ?? [:])
            }
        })
        
    }
    
    
    func request(urlString: String,
                 method: HTTPMethod,
                 parameters: [String: Any]? = nil,
                 completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        guard let url = URL(string: urlString) else {
      
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        if(method == .post){
            if let parameters = parameters {
                request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            }
        }
        else if(method == .get){
            if let query = convertParametersToQuery(parameters: parameters) {
                var urlComponents = URLComponents(string: urlString)
                urlComponents?.query = query
                
                if let url = urlComponents?.url {
                    request = URLRequest(url: url)
                }
            }
        }
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: completion)
        task.resume()
    }
    

    
    func convertParametersToQuery(parameters: [String: Any]?) -> String? {
        guard let parameters = parameters else {
            return nil
        }
        
        var queryItems: [URLQueryItem] = []
        
        for (key, value) in parameters {
            let stringValue: String
            if let arrayValue = value as? [Any] {
                // Convert array values to comma-separated string
                stringValue = arrayValue.map { String(describing: $0) }.joined(separator: ",")
            } else {
                stringValue = String(describing: value)
            }
            let queryItem = URLQueryItem(name: key, value: stringValue)
            queryItems.append(queryItem)
        }
        
        if !queryItems.isEmpty {
            var components = URLComponents()
            components.queryItems = queryItems
            return components.query
        }
        
        return nil
    }
    
    
    func getDefaultParameters() -> [String: Any]{
        let queryItems = ["api_key": ServerConfigurationsManager.sharedInstance.apiKey ]
        return queryItems
    }
    
}

