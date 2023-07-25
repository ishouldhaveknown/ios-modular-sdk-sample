//
//  CoreRepositoryTests.swift
//  CoreSDKTests
//
//  Created by Be on 07.07.23.
//

import XCTest
import Combine
@testable import CoreSDK

class CoreRepositoryTests: XCTestCase {
    
    private var cancellables: Set<AnyCancellable> = []
     
    func test_fetchCoreInfo_success() {
        // GIVEN
        let sut = CoreRepository(apiClient: MockAPIClient(hasInternet: true))
        let expectation = XCTestExpectation(description: "Should fetch config successfully")
        
        // WHEN
        sut.fetchCoreInfo()
            .sink { result in
                if case .failure = result {
                    XCTFail("Should not have failed")
                }
            } receiveValue: { info in
                // THEN
                XCTAssertEqual(info.apiVersion, "1.0.0")
                XCTAssertEqual(info.basePath, "https://test.com")
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 0.1)
    }
    
    func test_fetchCoreInfo_error() {
        // GIVEN
        let sut = CoreRepository(apiClient: MockAPIClient(hasInternet: false))
        let expectation = XCTestExpectation(description: "Should not fetch config successfully")
        
        // WHEN
        sut.fetchCoreInfo()
            .sink { result in
                switch result {
                case .finished:
                    XCTFail("Should have failed")
                case .failure(let error):
                    if case .apiError(error: .noInternet) = error {
                        // THEN
                        expectation.fulfill()
                    } else {
                        XCTFail("Should have failed with correct error type")
                    }
                }
            } receiveValue: { _ in }
            .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 0.1)
    }
}
