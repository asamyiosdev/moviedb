//
//  movieApiProvider.swift
//  moviedb
//
//  Created by Ahmed samy on 19/07/2024.
//

import Foundation

class MovieApiProvider {
    static func get() -> MovieApi {
        return MovieApi(apiClient: ApiClient())
    }
}
