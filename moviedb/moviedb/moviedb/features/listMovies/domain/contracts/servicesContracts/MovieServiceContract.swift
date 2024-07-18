//
//  MovieServiceContract.swift
//  moviedb
//
//  Created by Ahmed samy on 19/07/2024.
//

import Foundation

protocol MovieServiceContract {
    
    func getNowPlaying(
        success: @escaping ((ListMovieApiResponse) -> Void),
        failed: @escaping (([String: Any]) -> Void));
    
    func getPopular(
        success: @escaping ((ListMovieApiResponse) -> Void),
        failed: @escaping (([String: Any]) -> Void));
    
    func getUpcoming(
        success: @escaping ((ListMovieApiResponse) -> Void),
        failed: @escaping (([String: Any]) -> Void));
}


