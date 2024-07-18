//
//  movieApiProviderTests.swift
//  moviedbTests
//
//  Created by Ahmed samy on 19/07/2024.
//

import XCTest

class MovieApiProviderTests: XCTestCase {
    func testGetReturnsMovieApiInstance() {
        // Call the method
        let movieApi = MovieApiProvider.get()
        // Assert that the returned object is of type MovieApi
        XCTAssertNotNil(movieApi, "The MovieApi instance should not be nil.")
    }
}

