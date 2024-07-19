//
//  MovieServiceProviderTests.swift
//  moviedbTests
//
//  Created by Ahmed samy on 19/07/2024.
//

import XCTest

class MovieServiceProviderTests: XCTestCase {
    func testGetReturnsMovieServiceInstance() {
        // Call the method
        let MovieService = MovieServiceProvider.get()
        // Assert that the returned object is of type MovieService
        XCTAssertNotNil(MovieService, "The MovieService instance should not be nil.")
    }
}

