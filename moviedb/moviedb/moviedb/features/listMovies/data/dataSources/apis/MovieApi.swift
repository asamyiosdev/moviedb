//
//  MovieApi.swift
//  moviedb
//
//  Created by Ahmed samy on 18/07/2024.
//

import Foundation

class MovieApi: MovieApiContract {
    private let apiClient: ApiClientContract
    
    init(apiClient: ApiClientContract) {
        self.apiClient = apiClient
    }
    
    // MARK: - List type movies
    
    func getNowPlaying(page:Int,success: @escaping ((ListMovieApiResponseDataModel) -> Void), failed: @escaping (([String : Any]) -> Void)) {
        
        let parameters = ["page": String(page)]
        self.apiClient.call(method: HTTPMethod.get, parameters: parameters, webserviceType: WebserviceType.nowPlaying,
                            success: { response in
            let reponseItem = ListMovieApiResponseDataMapper.fromApiMap(response: response)
            success(reponseItem)
            
        },
                            failed: { error in
            failed(error)
            
        })
        
    }
    
    func getPopular(page:Int, success: @escaping ((ListMovieApiResponseDataModel) -> Void), failed: @escaping (([String : Any]) -> Void)) {
        let parameters = ["page": String(page)]
        self.apiClient.call(method: HTTPMethod.get,
                            parameters: parameters,
                            webserviceType: WebserviceType.popular,
                            success: { response in
            let reponseItem = ListMovieApiResponseDataMapper.fromApiMap(response: response)
            success(reponseItem)
        },
                            failed: { error in
            failed(error)
            
        })
        
        
    }
    
    func getUpcoming(page:Int, success: @escaping ((ListMovieApiResponseDataModel) -> Void), failed: @escaping (([String : Any]) -> Void)) {
        let parameters = ["page": String(page)]
        self.apiClient.call(method: HTTPMethod.get,parameters: parameters,webserviceType: WebserviceType.upcoming,
                            success: { response in
            let reponseItem = ListMovieApiResponseDataMapper.fromApiMap(response: response)
            success(reponseItem)
            
        },
                            failed: { error in
            failed(error)
            
        })
    }
    
    // MARK: - MovieDetails
    
    
    
    func getMovieDetails(
        id:Int,
        success: @escaping ((MovieDetailsDataModel) -> Void),
        failed: @escaping (([String: Any]) -> Void)){
            
            let webserviceType = WebserviceType.movieDetails +  String(id)
            self.apiClient.call(method: HTTPMethod.get,
                                parameters: nil,
                                webserviceType: webserviceType,
                                success: { response in
                let reponseItem = MovieDetailsDataMapper.fromApiMap(response: response)
                success(reponseItem)
                
            },
                                failed: { error in
                failed(error)
                
            })
        }
    
}


