//
//  GetUpcomingUsecaseProvider.swift
//  moviedb
//
//  Created by Ahmed samy on 19/07/2024.
//

import Foundation

class GetUpcomingUsecaseProvider {
    static func get() -> GetUpcomingUsecase {
        return GetUpcomingUsecase(movieService: MovieServiceProvider.get())
    }
}
