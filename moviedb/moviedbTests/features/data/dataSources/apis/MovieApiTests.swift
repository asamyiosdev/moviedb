//
//  MovieApiTests.swift
//  moviedbTests
//
//  Created by Ahmed samy on 18/07/2024.
//

import XCTest

class MovieApiTests: XCTestCase {
    var movieApi: MovieApi!
    var mockApiClient: MockApiClient!
    
    override func setUp() {
        super.setUp()
        mockApiClient = MockApiClient()
        movieApi = MovieApi(apiClient: mockApiClient)
    }
    
    override func tearDown() {
        movieApi = nil
        mockApiClient = nil
        super.tearDown()
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
    
    
    func testGetNowPlaying() {
        // Arrange
        let expectedResponse = getListMovieApiResponseDataModel()
    
        
        mockApiClient.stubbedNowPlayingResponse = expectedResponse
        
        // Act
        var receivedResponse: ListMovieApiResponseDataModel?
        movieApi.getNowPlaying() { response in
            receivedResponse = response
        } failed: { error in
            XCTFail("getNowPlaying call failed: \(error)")
        }
        
        // Assert
        XCTAssertNotNil(receivedResponse)
        XCTAssertEqual(receivedResponse, expectedResponse)
    }
    
    func testGetPopular() {
        // Arrange
        let expectedResponse = getListMovieApiResponseDataModel()
        mockApiClient.stubbedPopularResponse = expectedResponse
        
        // Act
        var receivedResponse: ListMovieApiResponseDataModel?
        movieApi.getPopular() { response in
            receivedResponse = response
        } failed: { error in
            XCTFail("getPopular call failed: \(error)")
        }
        
        // Assert
        XCTAssertNotNil(receivedResponse)
        XCTAssertEqual(receivedResponse, expectedResponse)
    }
    
    func testGetUpcoming() {
        // Arrange
        let expectedResponse = getListMovieApiResponseDataModel()
        mockApiClient.stubbedUpcomingResponse = expectedResponse
        
        // Act
        var receivedResponse: ListMovieApiResponseDataModel?
        movieApi.getUpcoming() { response in
            receivedResponse = response
        } failed: { error in
            XCTFail("getUpcoming call failed: \(error)")
        }
        
        // Assert
        XCTAssertNotNil(receivedResponse)
        XCTAssertEqual(receivedResponse, expectedResponse)
    }
}


class MockApiClient: ApiClientContract {
    
    var stubbedNowPlayingResponse: ListMovieApiResponseDataModel?
    var stubbedPopularResponse: ListMovieApiResponseDataModel?
    var stubbedUpcomingResponse: ListMovieApiResponseDataModel?
    
    let responseJson: [String: Any] = [
        "dates": [
            "maximum": "2024-07-24",
            "minimum": "2024-06-12"
        ],
        "page": 1,
        "results": [
            [
                "adult": false,
                "backdrop_path": "/nxxCPRGTzxUH8SFMrIsvMmdxHti.jpg",
                "genre_ids": [
                    35,
                    14,
                    10751
                ],
                "id": 639720,
                "original_language": "en",
                "original_title": "IF",
                "overview": "A young girl who goes through a difficult experience begins to see everyone's imaginary friends who have been left behind as their real-life friends have grown up.",
                "popularity": 386.705,
                "poster_path": "/xbKFv4KF3sVYuWKllLlwWDmuZP7.jpg",
                "release_date": "2024-05-08",
                "title": "IF",
                "video": false,
                "vote_average": 7.381,
                "vote_count": 642
            ]
        ],
        "total_pages": 178,
        "total_results": 3552
    ]
    
    
     func call(parameters: [String: Any]?, webserviceType: String, success: @escaping ([String: Any]) -> Void, failed: @escaping ([String: Any]) -> Void) {
        switch webserviceType {
        case WebserviceType.nowPlaying:
            if stubbedNowPlayingResponse != nil {
                success(responseJson)
            } else {
                failed(["error": "Failed to get now playing movies"])
            }
        case WebserviceType.popular:
            if stubbedPopularResponse != nil {
                success(responseJson)
            } else {
                failed(["error": "Failed to get popular movies"])
            }
        case WebserviceType.upcoming:
            if stubbedUpcomingResponse != nil {
                success(responseJson)
            } else {
                failed(["error": "Failed to get upcoming movies"])
            }
        default:
            failed(["error": "Invalid webservice type"])
        }
    }
}
