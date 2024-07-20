//
//  MovieApiContract.swift
//  moviedb
//
//  Created by Ahmed samy on 18/07/2024.
//

import Foundation

protocol MovieApiContract {
    
    func getNowPlaying(
        page:Int,
        success: @escaping ((ListMovieApiResponseDataModel) -> Void),
        failed: @escaping (([String: Any]) -> Void));
    
    func getPopular(
        page:Int,
        success: @escaping ((ListMovieApiResponseDataModel) -> Void),
        failed: @escaping (([String: Any]) -> Void));
    
    func getUpcoming(
        page:Int,
        success: @escaping ((ListMovieApiResponseDataModel) -> Void),
        failed: @escaping (([String: Any]) -> Void));
    
}

