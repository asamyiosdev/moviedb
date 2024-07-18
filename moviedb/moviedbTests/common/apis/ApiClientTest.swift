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
        apiClient = ApiClient.shared
    }

    override func tearDown() {
        apiClient = nil
        super.tearDown()
    }

    func testCallWithValidWebserviceType() {
    
        let expectation = XCTestExpectation(description: "Successful API call")

        apiClient.call(webserviceType: WebserviceType.popular) { response in
            XCTAssertNotNil(response)
            expectation.fulfill()
        } failed: { error in
            XCTFail("API call failed: \(error)")
        }

        wait(for: [expectation], timeout: 10.0)
    }


    func testRequestWithValidURL() {
        let expectation = XCTestExpectation(description: "Successful API request")

        apiClient.request(urlString: "https://example.com", method: .get) { data, response, error in
            XCTAssertNotNil(data)
            XCTAssertNil(error)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 10.0)
    }

    func testRequestWithInvalidURL() {
        let expectation = XCTestExpectation(description: "Failed API request")

        apiClient.request(urlString: "invalid_url", method: .get) { data, response, error in
            XCTAssertNil(data)
            XCTAssertNotNil(error)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 10.0)
    }
}
