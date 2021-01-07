//
//  URLSessionManagerTests.swift
//  MeventsUnitTests
//
//  Created by Isnard Silva on 05/01/21.
//

import XCTest
@testable import Mevents

final class URLSessionManagerTests: XCTestCase {
    // MARK: - Properties
    var sut: URLSessionManager!
    
    
    // MARK: - Setup Methods
    override func setUp() {
        super.setUp()
        sut = URLSessionManager()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    
    // MARK: - Test Methods
    func testCallToAnValidURL() {
        // Given
        let fakeService = FakeServiceInfo.getData
        let promise = expectation(description: "Call to an valid API")
        
        // When
        sut.request(service: fakeService, completionHandler: { result in
            // Then
            switch result {
            case .failure(let error):
                XCTFail(error.localizedDescription)
            case .success:
                break
            }
            
            promise.fulfill()
        })
        wait(for: [promise], timeout: 5)
    }
}
