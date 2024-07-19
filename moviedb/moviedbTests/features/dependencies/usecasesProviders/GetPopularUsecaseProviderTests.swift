//
//  GetPopularUsecaseProviderTests.swift
//  moviedbTests
//
//  Created by Ahmed samy on 19/07/2024.
//

import XCTest

final class GetPopularUsecaseProviderTests: XCTestCase {
    func testGetReturnsGetPopularUsecaseInstance() {
        // Call the method
        let getPopularUsecase = GetPopularUsecaseProvider.get()
        // Assert that the returned object is of type GetNowPlayingUsecase
        XCTAssertNotNil(getPopularUsecase, "The PopularUsecase instance should not be nil.")
    }
}
