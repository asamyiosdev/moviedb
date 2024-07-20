//
//  MovieServiceTests.swift
//  moviedbTests
//
//  Created by Ahmed samy on 19/07/2024.
//

import XCTest

class MovieServiceTests: XCTestCase {
    var movieService: MovieService!
    var mockMovieApi: MockMovieApi!
    
    override func setUp() {
        super.setUp()
        mockMovieApi = MockMovieApi()
        movieService = MovieService(movieApi: mockMovieApi)
    }
    
    override func tearDown() {
        movieService = nil
        mockMovieApi = nil
        super.tearDown()
    }
    
    
    // MARK: - helper
    
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
    
    func getListMovieApiResponseDataModel() -> ListMovieApiResponseDataModel{
        let exampleMovie = MovieDataModel(
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
            
            let exampleResponse = ListMovieApiResponseDataModel(
                dates: exampleDates,
                page: 1,
                results: [exampleMovie],
                totalPages: 178,
                totalResults: 3552
            )
        return exampleResponse
    }
    
    
    
    // MARK: - GetNowPlaying
    
    func testGetNowPlayingSuccess() {
        // Arrange
        let expectedResponse = getListMovieApiResponse()
        mockMovieApi.nowPlayingResponse = getListMovieApiResponseDataModel()
        
        let expectation = self.expectation(description: "Success callback should be called")
        
        // Act
        movieService.getNowPlaying(page:1, success: { response in
            XCTAssertEqual(response, expectedResponse, "The response should match the expected response.")
            expectation.fulfill()
        }, failed: { _ in
            XCTFail("Failure callback should not be called")
        })
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGetNowPlayingFailure() {
        // Arrange
        let expectedError: [String: Any] = ["error": "Something went wrong"]
        mockMovieApi.nowPlayingError = expectedError
        
        let expectation = self.expectation(description: "Failure callback should be called")
        
        // Act
        movieService.getNowPlaying(page:1,success: { _ in
            XCTFail("Success callback should not be called")
        }, failed: { error in
            XCTAssertEqual(error as NSDictionary, expectedError as NSDictionary, "The error should match the expected error.")
            expectation.fulfill()
        })
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    
    
    // MARK: - GetPopular
    
    
    func testGetPopularSuccess() {
        // Arrange
        let expectedResponse = getListMovieApiResponse()
        mockMovieApi.popularResponse = getListMovieApiResponseDataModel()
        
        let expectation = self.expectation(description: "Success callback should be called")
        
        // Act
        movieService.getPopular(page:1,success: { response in
            XCTAssertEqual(response, expectedResponse, "The response should match the expected response.")
            expectation.fulfill()
        }, failed: { _ in
            XCTFail("Failure callback should not be called")
        })
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGetPopularFailure() {
        // Arrange
        let expectedError: [String: Any] = ["error": "Something went wrong"]
        mockMovieApi.popularError = expectedError
        
        let expectation = self.expectation(description: "Failure callback should be called")
        
        // Act
        movieService.getPopular(page:1,success: { _ in
            XCTFail("Success callback should not be called")
        }, failed: { error in
            XCTAssertEqual(error as NSDictionary, expectedError as NSDictionary, "The error should match the expected error.")
            expectation.fulfill()
        })
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    
    // MARK: - GetUpcoming
    
    func testGetUpcomingSuccess() {
        // Arrange
        let expectedResponse = getListMovieApiResponse()
        mockMovieApi.upcomingResponse = getListMovieApiResponseDataModel()
        
        let expectation = self.expectation(description: "Success callback should be called")
        
        // Act
        movieService.getUpcoming(page:1,success: { response in
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
        mockMovieApi.upcomingError = expectedError
        
        let expectation = self.expectation(description: "Failure callback should be called")
        
        // Act
        movieService.getUpcoming(page:1,success: { _ in
            XCTFail("Success callback should not be called")
        }, failed: { error in
            XCTAssertEqual(error as NSDictionary, expectedError as NSDictionary, "The error should match the expected error.")
            expectation.fulfill()
        })
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }

}



class MockMovieApi: MovieApiContract {
    
    var nowPlayingResponse: ListMovieApiResponseDataModel?
    var popularResponse: ListMovieApiResponseDataModel?
    var upcomingResponse: ListMovieApiResponseDataModel?
    
    var nowPlayingError: [String: Any]?
    var popularError: [String: Any]?
    var upcomingError: [String: Any]?
    
    
    func getNowPlaying(page:Int,success: @escaping ((ListMovieApiResponseDataModel) -> Void), failed: @escaping (([String : Any]) -> Void)) {
        if let response = nowPlayingResponse {
            success(response)
        } else if let error = nowPlayingError {
            failed(error)
        }
    }
    
    func getPopular(page:Int,success: @escaping ((ListMovieApiResponseDataModel) -> Void), failed: @escaping (([String : Any]) -> Void)) {
        if let response = popularResponse {
            success(response)
        } else if let error = popularError {
            failed(error)
        }
    }
    
    func getUpcoming(page:Int, success: @escaping ((ListMovieApiResponseDataModel) -> Void), failed: @escaping (([String : Any]) -> Void)) {
        if let response = upcomingResponse {
            success(response)
        } else if let error = upcomingError {
            failed(error)
        }
    }
    
}

