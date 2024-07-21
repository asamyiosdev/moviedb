//
//  MovieServiceContract.swift
//  moviedb
//
//  Created by Ahmed samy on 19/07/2024.
//

import Foundation

protocol MovieServiceContract {
    
    // MARK: - List type movies
    
    func getNowPlaying(
        page:Int,
        success: @escaping ((ListMovieApiResponse) -> Void),
        failed: @escaping (([String: Any]) -> Void));
    
    func getPopular(
        page:Int,
        success: @escaping ((ListMovieApiResponse) -> Void),
        failed: @escaping (([String: Any]) -> Void));
    
    func getUpcoming(
        page:Int,
        success: @escaping ((ListMovieApiResponse) -> Void),
        failed: @escaping (([String: Any]) -> Void));
    
    
    // MARK: - MovieDetails
    
    func getMovieDetails(
        id:Int,
        success: @escaping ((MovieDetails) -> Void),
        failed: @escaping (([String: Any]) -> Void));
    
}


