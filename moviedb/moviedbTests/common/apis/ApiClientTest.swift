//
//  ApiClientTest.swift
//  moviedbTests
//
//  Created by Ahmed samy on 18/07/2024.
//

import XCTest


class ApiClientTest: XCTestCase {
    var apiClient: ApiClient!
    
    override func setUp() {
        super.setUp()
        apiClient = ApiClient()
    }
    
    override func tearDown() {
        apiClient = nil
        super.tearDown()
    }
    
    func testCallWithValidWebserviceType() {
        
        let expectation = XCTestExpectation(description: "Successful API call")
        
        apiClient.call(method: HTTPMethod.get, webserviceType: WebserviceType.popular) { response in
            XCTAssertNotNil(response)
            expectation.fulfill()
        } failed: { error in
            XCTFail("API call failed: \(error)")
        }
        
        wait(for: [expectation], timeout: 10.0)
    }
    
    
    func testRequestWithValidURL() {
        // Arrange
        let expectation = XCTestExpectation(description: "Successful API request")
        
        // Act
        apiClient.request(urlString: "https://example.com", method: .get) { result in
            // Assert
            switch result {
            case .success(let data):
                XCTAssertNotNil(data) // Ensure data is not nil
            case .failure(let error):
                XCTFail("Request should succeed with a valid URL. Error: \(error)")
            }
            
            expectation.fulfill()
        }
        
        // Wait for the expectation to be fulfilled
        wait(for: [expectation], timeout: 10.0)
    }
    
    
    func testRequestWithInvalidURL() {
        // Arrange
        let expectation = XCTestExpectation(description: "Failed API request")
        // Act
        apiClient.request(urlString: "invalid_url", method: .get) { result in
            // Assert
            switch result {
            case .success:
                XCTFail("Request should fail with an invalid URL")
            case .failure(let error):
                XCTAssertNotNil(error) // Ensure error is not nil
            }
            
            expectation.fulfill()
        }
        
        // Wait for the expectation to be fulfilled
        wait(for: [expectation], timeout: 10.0)
    }
}
