//
//  MovieDetailsViewModel.swift
//  moviedb
//
//  Created by Ahmed samy on 20/07/2024.
//

import UIKit

class MovieDetailsViewModel{
 

 private   var getMovieDetailsUsecase: GetMovieDetailsUsecaseContract
    
  var movieDetails:MovieDetails? = nil
    
    // MARK: - Public Methods
    //
    
    init(
        getMovieDetailsUsecase: GetMovieDetailsUsecase) {
            self.getMovieDetailsUsecase = getMovieDetailsUsecase
        }
    
    
    func getMovieDetails(id: Int,
                       success: @escaping (() -> Void), failed: @escaping (([String : Any]) -> Void)) {
       
        self.getMovieDetailsUsecase.get(id:id,
                                     success: { response in
            self.movieDetails = response
            success()
        },
                                     failed: { error in
            failed(error)
            
        })
    }
    
    
    
}

