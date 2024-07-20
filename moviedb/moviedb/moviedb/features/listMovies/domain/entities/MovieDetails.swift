//
//  MovieDetails.swift
//  moviedb
//
//  Created by Ahmed samy on 20/07/2024.
//

import Foundation


// MARK: - MovieDetails
struct MovieDetails {
    let adult: Bool
    let backdropPath: String
    let belongsToCollection: BelongsToCollection
    let budget: Int
    let genres: [Genre]
    let homepage: String
    let id: Int
    let imdbID: String
    let originCountry: [String]
    let originalLanguage, originalTitle, overview: String
    let popularity: Double
    let posterPath: String
    let productionCompanies: [ProductionCompany]
    let productionCountries: [ProductionCountry]
    let releaseDate: String
    let revenue, runtime: Int
    let status, tagline, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
}

// MARK: - BelongsToCollection
struct BelongsToCollection {
    let id: Int
    let name, posterPath, backdropPath: String
}

// MARK: - Genre
struct Genre {
    let id: Int
    let name: String
}

// MARK: - ProductionCompany
struct ProductionCompany {
    let id: Int
    let logoPath, name, originCountry: String
}

// MARK: - ProductionCountry
struct ProductionCountry {
    let iso3166_1, name: String
}


