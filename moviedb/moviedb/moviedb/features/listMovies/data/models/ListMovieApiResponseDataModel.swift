//
//  ListMovieApiResponseDataModel.swift
//  moviedb
//
//  Created by Ahmed samy on 18/07/2024.
//

import Foundation

struct ListMovieApiResponseDataModel : Equatable{
    let dates: Dates
    let page: Int
    let results: [MovieDataModel]
    let totalPages, totalResults: Int
    
    static func == (lhs: ListMovieApiResponseDataModel, rhs: ListMovieApiResponseDataModel) -> Bool {
        return lhs.results.count == rhs.results.count &&
        lhs.dates == rhs.dates  &&
        lhs.totalPages == rhs.totalPages  &&
        lhs.results.count == rhs.results.count 
    }
    
}
