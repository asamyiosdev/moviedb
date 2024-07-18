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
    
    func getNowPlaying(webserviceType: String, success: @escaping ((ListMovieApiResponseDataModel) -> Void), failed: @escaping (([String : Any]) -> Void)) {
        self.apiClient.call(parameters: nil, webserviceType: WebserviceType.nowPlaying,
                              success: { response in
            let reponseItem = ListMovieApiResponseDataMapper.fromApiMap(response: response)
            success(reponseItem)
            
        },
                              failed: { error in
            failed(error)
            
        })
        
    }
    
    func getPopular(webserviceType: String, success: @escaping ((ListMovieApiResponseDataModel) -> Void), failed: @escaping (([String : Any]) -> Void)) {
        
        self.apiClient.call(parameters: nil,webserviceType: WebserviceType.popular,
                              success: { response in
            let reponseItem = ListMovieApiResponseDataMapper.fromApiMap(response: response)
            success(reponseItem)
            
        },
                              failed: { error in
            failed(error)
            
        })
        
        
    }
    
    func getUpcoming(webserviceType: String, success: @escaping ((ListMovieApiResponseDataModel) -> Void), failed: @escaping (([String : Any]) -> Void)) {
        
        self.apiClient.call(parameters: nil,webserviceType: WebserviceType.upcoming,
                              success: { response in
            let reponseItem = ListMovieApiResponseDataMapper.fromApiMap(response: response)
            success(reponseItem)
            
        },
                              failed: { error in
            failed(error)
            
        })
    }
}


