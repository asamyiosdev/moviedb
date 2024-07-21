//
//  GetMovieDetailsUsecaseProvider.swift
//  moviedb
//
//  Created by Ahmed samy on 21/07/2024.
//

import Foundation

class GetMovieDetailsUsecaseProvider {
    static func get() -> GetMovieDetailsUsecase {
        return GetMovieDetailsUsecase(movieService: MovieServiceProvider.get())
    }
}

