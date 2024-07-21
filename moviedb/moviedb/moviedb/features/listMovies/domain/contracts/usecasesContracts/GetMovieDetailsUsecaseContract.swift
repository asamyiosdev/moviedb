//
//  GetMovieDetailsUsecaseContract.swift
//  moviedb
//
//  Created by Ahmed samy on 20/07/2024.
//

import Foundation

protocol GetMovieDetailsUsecaseContract {
    func get(
        id:Int,
        success: @escaping ((MovieDetails) -> Void),
        failed: @escaping (([String: Any]) -> Void));
}

