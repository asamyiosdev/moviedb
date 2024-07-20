//
//  MovieDetailsDataModel.swift
//  moviedb
//
//  Created by Ahmed samy on 20/07/2024.
//

import Foundation

// MARK: - MovieDetailsDataModel
struct MovieDetailsDataModel {
    let adult: Bool
    let backdropPath: String
    let belongsToCollection: BelongsToCollectionDataModel
    let budget: Int
    let genres: [GenreDataModel]
    let homepage: String
    let id: Int
    let imdbID: String
    let originCountry: [String]
    let originalLanguage, originalTitle, overview: String
    let popularity: Double
    let posterPath: String
    let productionCompanies: [ProductionCompanyDataModel]
    let productionCountries: [ProductionCountryDataModel]
    let releaseDate: String
    let revenue, runtime: Int
    let status, tagline, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
}

// MARK: - BelongsToCollection
struct BelongsToCollectionDataModel {
    let id: Int
    let name, posterPath, backdropPath: String
}

// MARK: - Genre
struct GenreDataModel {
    let id: Int
    let name: String
}

// MARK: - ProductionCompany
struct ProductionCompanyDataModel {
    let id: Int
    let logoPath, name, originCountry: String
}

// MARK: - ProductionCountry
struct ProductionCountryDataModel {
    let iso3166_1, name: String
}
