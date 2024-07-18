//
//  MovieApiContract.swift
//  moviedb
//
//  Created by Ahmed samy on 18/07/2024.
//

import Foundation

protocol MovieApiContract {
    
    func getNowPlaying(webserviceType: String,
              success: @escaping ((ListMovieApiResponseDataModel) -> Void),
              failed: @escaping (([String: Any]) -> Void));
    
    func getPopular(webserviceType: String,
              success: @escaping ((ListMovieApiResponseDataModel) -> Void),
              failed: @escaping (([String: Any]) -> Void));
    
    func getUpcoming(webserviceType: String,
              success: @escaping ((ListMovieApiResponseDataModel) -> Void),
              failed: @escaping (([String: Any]) -> Void));

}

