//
//  GetUpcomingUsecase.swift
//  moviedb
//
//  Created by Ahmed samy on 19/07/2024.
//

import Foundation

class GetUpcomingUsecase: GetListMoviesUsecaseContract {
    
    private let movieService: MovieServiceContract
    
    init(movieService: MovieServiceContract) {
        self.movieService = movieService
    }
    
    func get(page:Int,success: @escaping ((ListMovieApiResponse) -> Void), failed: @escaping (([String : Any]) -> Void)) {
        
        self.movieService.getUpcoming(page: page, success: { response in
            success(response)
            
        },
                                      failed: { error in
            failed(error)
            
        })
    }
    
}

