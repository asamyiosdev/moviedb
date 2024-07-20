//
//  GetListMoviesUsecaseContract.swift
//  moviedb
//
//  Created by Ahmed samy on 20/07/2024.
//

import Foundation

protocol GetListMoviesUsecaseContract {
    func get(
        page:Int,
        success: @escaping ((ListMovieApiResponse) -> Void),
        failed: @escaping (([String: Any]) -> Void));
}

