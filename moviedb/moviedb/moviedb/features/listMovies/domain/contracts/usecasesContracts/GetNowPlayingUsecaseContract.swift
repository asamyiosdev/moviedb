//
//  GetNowPlayingUsecaseContract.swift
//  moviedb
//
//  Created by Ahmed samy on 19/07/2024.
//

import Foundation

protocol GetNowPlayingUsecaseContract {
    func get(
        success: @escaping ((ListMovieApiResponse) -> Void),
        failed: @escaping (([String: Any]) -> Void));
}

