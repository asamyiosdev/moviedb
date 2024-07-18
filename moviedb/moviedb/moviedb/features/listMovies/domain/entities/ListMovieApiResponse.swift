//
//  ListMovieApiResponse.swift
//  moviedb
//
//  Created by Ahmed samy on 19/07/2024.
//

import Foundation

struct ListMovieApiResponse : Equatable{

    let dates: Dates
    let page: Int
    let results: [Movie]
    let totalPages, totalResults: Int
    
    static func == (lhs: ListMovieApiResponse, rhs: ListMovieApiResponse) -> Bool {
        return lhs.results.count == rhs.results.count &&
        lhs.dates == rhs.dates  &&
        lhs.totalPages == rhs.totalPages  &&
        lhs.results.count == rhs.results.count
    }
}
