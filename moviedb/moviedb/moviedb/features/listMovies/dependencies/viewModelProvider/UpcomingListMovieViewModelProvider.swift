//
//  UpcomingListMovieViewModelProvider.swift
//  moviedb
//
//  Created by Ahmed samy on 20/07/2024.
//

import Foundation

class UpcomingListMovieViewModelProvider {
    static func get() -> UpcomingListMovieViewModel {
        return UpcomingListMovieViewModel(getUpcomingUsecase: GetUpcomingUsecaseProvider.get())
    }
}
