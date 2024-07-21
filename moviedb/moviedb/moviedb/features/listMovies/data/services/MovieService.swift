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
    
    
    // MARK: - List type movies
    
    
    func getNowPlaying(page:Int,success: @escaping ((ListMovieApiResponse) -> Void), failed: @escaping (([String : Any]) -> Void)) {
        self.movieApi.getNowPlaying(page: page, success: { response in
            let reponseItem = ListMovieApiResponseDataMapper.toEntity(dataMode: response)
            success(reponseItem)
            
        },
                                    failed: { error in
            failed(error)
            
        })
    }
    
    func getPopular(page:Int,success: @escaping ((ListMovieApiResponse) -> Void), failed: @escaping (([String : Any]) -> Void)) {
        self.movieApi.getPopular(page: page,success: { response in
            let reponseItem = ListMovieApiResponseDataMapper.toEntity(dataMode: response)
            success(reponseItem)
            
        },
                                 failed: { error in
            failed(error)
            
        })
        
    }
    
    func getUpcoming(page:Int,success: @escaping ((ListMovieApiResponse) -> Void), failed: @escaping (([String : Any]) -> Void)) {
        self.movieApi.getUpcoming(page: page,success: { response in
            let reponseItem = ListMovieApiResponseDataMapper.toEntity(dataMode: response)
            success(reponseItem)
            
        },
                                  failed: { error in
            failed(error)
            
        })
    }
    
    // MARK: - MovieDetails
    
    func getMovieDetails(
        id:Int,
        success: @escaping ((MovieDetails) -> Void),
        failed: @escaping (([String: Any]) -> Void)){
            self.movieApi.getMovieDetails(id: id,success: { response in
                let reponseItem = MovieDetailsDataMapper.toEntity(dataMode: response)
                success(reponseItem)
                
            },
                                          failed: { error in
                failed(error)
                
            })
        }
    
}



