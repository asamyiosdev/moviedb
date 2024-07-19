//
//  GetUpcomingUsecaseProviderTests.swift
//  moviedbTests
//
//  Created by Ahmed samy on 19/07/2024.
//

import XCTest

final class GetUpcomingUsecaseProviderTests: XCTestCase {
    
    func testGetReturnsUpcomingUsecaseInstance() {
        // Call the method
        let getUpcomingUsecase = GetUpcomingUsecaseProvider.get()
        // Assert that the returned object is of type GetNowPlayingUsecase
        XCTAssertNotNil(getUpcomingUsecase, "The getUpcomingUsecase instance should not be nil.")
    }
}
