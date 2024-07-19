//
//  GetNowPlayingUsecaseProvider.swift
//  moviedb
//
//  Created by Ahmed samy on 19/07/2024.
//

import Foundation

class GetNowPlayingUsecaseProvider {
    static func get() -> GetNowPlayingUsecase {
        return GetNowPlayingUsecase(movieService: MovieServiceProvider.get())
    }
}
