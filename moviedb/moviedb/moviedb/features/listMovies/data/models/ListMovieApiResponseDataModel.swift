//
//  ListMovieApiResponseDataModel.swift
//  moviedb
//
//  Created by Ahmed samy on 18/07/2024.
//

import Foundation


import Foundation

// MARK: - Welcome8
struct ListMovieApiResponseDataModel {
    let dates: Dates
    let page: Int
    let results: [MovieDataModel]
    let totalPages, totalResults: Int
}
