//
//  ListMovieViewModelTests.swift
//  moviedbTests
//
//  Created by Ahmed samy on 20/07/2024.
//

import XCTest

final class ListMovieViewModelTests: XCTestCase {
    
    var sut: ListMovieViewModel!
    var mockGetListMoviesUsecase: MockGetListMoviesUsecase!
    
    override func setUp() {
        super.setUp()
        mockGetListMoviesUsecase = MockGetListMoviesUsecase()
        sut = ListMovieViewModel(getListMovieUsecase: mockGetListMoviesUsecase)
    }
    
    override func tearDown() {
        sut = nil
        mockGetListMoviesUsecase = nil
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
    
    
    func testOnReceiveResponse_SetsListMovieApiResponseAndListMovies() {
        // Arrange
        let mockResponse = getListMovieApiResponse()
        // Act
        sut.onrecieveResponse(response: mockResponse)
        
        // Assert
        XCTAssertEqual(sut.ListMovieApiResponse, mockResponse)
        XCTAssertEqual(sut.listMovies.count, mockResponse.results.count)
    }
    
    func testGetItemsForIndex_ReturnsCorrectMovie() {
        // Arrange
        let mockResponse = getListMovieApiResponse()
        
        sut.onrecieveResponse(response: mockResponse)
        
        // Act
        let movie1 = sut.getItemsForIndex(index: 0)
        
        // Assert
        XCTAssertEqual(movie1?.id, mockResponse.results[0].id)
    }
    
    func testGetNumberOfCell_ReturnsCorrectCount() {
        // Arrange
        let mockResponse = getListMovieApiResponse()
        sut.onrecieveResponse(response: mockResponse)
        
        // Act
        let cellCount = sut.getNumberOfCell()
        
        // Assert
        XCTAssertEqual(cellCount, 1)
    }
    
    
     
     func testShowMoreButton_WhenPageIsEqualToTotalPages_ReturnsFalse() {
         // Arrange
         _ = getListMovieApiResponse()
         
         // Act
         let showMore = sut.showMoreButton()
         
         // Assert
         XCTAssertFalse(showMore)
     }
     
     func testShowMoreButton_WhenDataIsNil_ReturnsFalse() {
         // Arrange
         sut.ListMovieApiResponse = nil
         
         // Act
         let showMore = sut.showMoreButton()
         
         // Assert
         XCTAssertFalse(showMore)
     }
    
}



// Mock class for GetListMoviesUsecase

class MockGetListMoviesUsecase: GetListMoviesUsecaseContract {
    var successResponse: ListMovieApiResponse?
    
    var failedError: [String: Any]?
    
    func get(page:Int,success: @escaping (ListMovieApiResponse) -> Void, failed: @escaping ([String: Any]) -> Void) {
        if let response = successResponse {
            success(response)
        } else if let error = failedError {
            failed(error)
        }
    }
    
}


