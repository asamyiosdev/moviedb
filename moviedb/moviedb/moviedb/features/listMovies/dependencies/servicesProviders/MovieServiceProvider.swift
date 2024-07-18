//
//  MovieServiceProvider.swift
//  moviedb
//
//  Created by Ahmed samy on 19/07/2024.
//

import Foundation

class MovieServiceProvider {
    static func get() -> MovieService {
        return MovieService(movieApi: MovieApiProvider.get())
    }
}
