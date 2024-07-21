//
//  GetMovieDetailsUsecase.swift
//  moviedb
//
//  Created by Ahmed samy on 20/07/2024.
//

import Foundation


class GetMovieDetailsUsecase: GetMovieDetailsUsecaseContract {
    
    private let movieService: MovieServiceContract
    
    init(movieService: MovieServiceContract) {
        self.movieService = movieService
    }
    
    func get(id:Int,success: @escaping ((MovieDetails) -> Void), failed: @escaping (([String : Any]) -> Void)) {
        
        self.movieService.getMovieDetails(id: id, success: { response in
            success(response)
            
        },
                                          failed: { error in
            failed(error)
            
        })
    }
    
}
