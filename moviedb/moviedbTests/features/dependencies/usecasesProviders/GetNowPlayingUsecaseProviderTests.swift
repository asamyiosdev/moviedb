//
//  GetNowPlayingUsecaseProviderTests.swift
//  moviedbTests
//
//  Created by Ahmed samy on 19/07/2024.
//

import XCTest

final class GetNowPlayingUsecaseProviderTests: XCTestCase {

    func testGetReturnsGetNowPlayingUsecaseInstance() {
        // Call the method
        let getNowPlayingUsecase = GetNowPlayingUsecaseProvider.get()
        // Assert that the returned object is of type GetNowPlayingUsecase
        XCTAssertNotNil(getNowPlayingUsecase, "The NowPlaying instance should not be nil.")
    }
}
