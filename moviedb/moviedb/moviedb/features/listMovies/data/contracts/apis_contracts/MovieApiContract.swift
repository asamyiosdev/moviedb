//
//  MovieApiContract.swift
//  moviedb
//
//  Created by Ahmed samy on 18/07/2024.
//

import Foundation

protocol MovieApiContract {
    
    func getNowPlaying(
        success: @escaping ((ListMovieApiResponseDataModel) -> Void),
        failed: @escaping (([String: Any]) -> Void));
    
    func getPopular(
        success: @escaping ((ListMovieApiResponseDataModel) -> Void),
        failed: @escaping (([String: Any]) -> Void));
    
    func getUpcoming(
        success: @escaping ((ListMovieApiResponseDataModel) -> Void),
        failed: @escaping (([String: Any]) -> Void));
    
}

