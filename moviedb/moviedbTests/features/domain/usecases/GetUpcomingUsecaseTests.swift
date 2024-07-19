//
//  GetUpcomingUsecaseTests.swift
//  moviedbTests
//
//  Created by Ahmed samy on 19/07/2024.
//

import XCTest

final class GetUpcomingUsecaseTests: XCTestCase {

    var getUpcomingUsecase: GetUpcomingUsecase!
    var mockMovieService: MockMovieService!
    
    override func setUp() {
        super.setUp()
        mockMovieService = MockMovieService()
        getUpcomingUsecase = GetUpcomingUsecase(movieService: mockMovieService)
    }
    
    override func tearDown() {
        getUpcomingUsecase = nil
        mockMovieService = nil
        super.tearDown()
    }
    
    func getListMovieApiResponse() -> ListMovieApiResponse{
        let exampleMovie = Movie(
            adult: false,
            backdropPath: "/nxxCPRGTzxUH8SFMrIsvMmdxHti.jpg",
            genreIDS: [35, 14, 10751],
            id: 639720,
            originalLanguage: OriginalLanguage.en,
            originalTitle: "IF",
            overview: "A young girl who goes through a difficult experience begins to see everyone's imaginary friends who have been left behind as their real-life friends have grown up.",
            popularity: 386.705,
            posterPath: "/xbKFv4KF3sVYuWKllLlwWDmuZP7.jpg",
            releaseDate: "2024-05-08",
            title: "IF",
            video: false,
            voteAverage: 7.381,
            voteCount: 642
        )
        
        let exampleDates = Dates(maximum: "2024-07-24", minimum: "2024-06-12")
        
        let exampleResponse = ListMovieApiResponse(
            dates: exampleDates,
            page: 1,
            results: [exampleMovie],
            totalPages: 178,
            totalResults: 3552
        )
        return exampleResponse
    }
    
    
    func testGetUpcomingSuccess() {
        // Arrange
        let expectedResponse = getListMovieApiResponse()
        mockMovieService.upcomingResponse = expectedResponse
        
        let expectation = self.expectation(description: "Success callback should be called")
        
        // Act
        getUpcomingUsecase.get(success: { response in
            XCTAssertEqual(response, expectedResponse, "The response should match the expected response.")
            expectation.fulfill()
        }, failed: { _ in
            XCTFail("Failure callback should not be called")
        })
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGetUpcomingFailure() {
        // Arrange
        let expectedError: [String: Any] = ["error": "Something went wrong"]
        mockMovieService.upcomingError = expectedError
        
        let expectation = self.expectation(description: "Failure callback should be called")
        
        // Act
        getUpcomingUsecase.get(success: { _ in
            XCTFail("Success callback should not be called")
        }, failed: { error in
            XCTAssertEqual(error as NSDictionary, expectedError as NSDictionary, "The error should match the expected error.")
            expectation.fulfill()
        })
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
}
