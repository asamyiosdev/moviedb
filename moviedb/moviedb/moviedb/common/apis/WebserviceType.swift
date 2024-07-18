//
//  WebserviceType.swift
//  moviedb
//
//  Created by Ahmed samy on 17/07/2024.
//

import Foundation

struct WebServiceSource {
    static let movie = "/3/movie"
}

struct WebserviceType {
    static let nowPlaying = "\(WebServiceSource.movie)/now_playing"
    
    static let popular = "\(WebServiceSource.movie)/popular"

    static let upcoming = "\(WebServiceSource.movie)/upcoming"
    
}
