//
//  GetPopularUsecaseProvider.swift
//  moviedb
//
//  Created by Ahmed samy on 19/07/2024.
//

import Foundation

class GetPopularUsecaseProvider {
    static func get() -> GetPopularUsecase {
        return GetPopularUsecase(movieService: MovieServiceProvider.get())
    }
}
