//
//  MovieDataModel.swift
//  moviedb
//
//  Created by Ahmed samy on 18/07/2024.
//

import Foundation
// MARK: - MovieDataModel
struct MovieDataModel {
    let adult: Bool
    let backdropPath: String
    let genreIDS: [Int]
    let id: Int
    let originalLanguage: OriginalLanguage
    let originalTitle, overview: String
    let popularity: Double
    let posterPath, releaseDate, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
}
