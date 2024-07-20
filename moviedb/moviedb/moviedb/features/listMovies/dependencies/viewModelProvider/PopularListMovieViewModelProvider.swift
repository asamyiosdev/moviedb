//
//  PopularListMovieViewModelProvider.swift
//  moviedb
//
//  Created by Ahmed samy on 20/07/2024.
//

import Foundation

class PopularListMovieViewModelProvider {
    static func get() -> PopularListMovieViewModel {
        return PopularListMovieViewModel(getPopularUsecase: GetPopularUsecaseProvider.get())
    }
}
