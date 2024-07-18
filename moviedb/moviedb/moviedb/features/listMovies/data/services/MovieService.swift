//
//  MovieService.swift
//  moviedb
//
//  Created by Ahmed samy on 19/07/2024.
//

import Foundation

class MovieService: MovieServiceContract {
    private let movieApi: MovieApiContract
    
    init(movieApi: MovieApiContract) {
        self.movieApi = movieApi
    }
    

    func getNowPlaying(success: @escaping ((ListMovieApiResponse) -> Void), failed: @escaping (([String : Any]) -> Void)) {
        self.movieApi.getNowPlaying(success: { response in
            let reponseItem = ListMovieApiResponseDataMapper.toEntity(dataMode: response)
            success(reponseItem)
            
        },
                                    failed: { error in
            failed(error)
            
        })
    }
    
    func getPopular(success: @escaping ((ListMovieApiResponse) -> Void), failed: @escaping (([String : Any]) -> Void)) {
        self.movieApi.getPopular(success: { response in
            let reponseItem = ListMovieApiResponseDataMapper.toEntity(dataMode: response)
            success(reponseItem)
            
        },
                                 failed: { error in
            failed(error)
            
        })
        
    }
    
    func getUpcoming(success: @escaping ((ListMovieApiResponse) -> Void), failed: @escaping (([String : Any]) -> Void)) {
        self.movieApi.getUpcoming(success: { response in
            let reponseItem = ListMovieApiResponseDataMapper.toEntity(dataMode: response)
            success(reponseItem)
            
        },
                                  failed: { error in
            failed(error)
            
        })
    }

}



