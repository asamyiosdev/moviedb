//
//  MovieDetailsViewModelProvider.swift
//  moviedb
//
//  Created by Ahmed samy on 21/07/2024.
//

import Foundation

class MovieDetailsViewModelProvider {
    static func get() -> MovieDetailsViewModel {
        return MovieDetailsViewModel(getMovieDetailsUsecase: GetMovieDetailsUsecaseProvider.get())
    }
}

