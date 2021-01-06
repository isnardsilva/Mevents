//
//  CheckInViewModelTests.swift
//  MeventsUnitTests
//
//  Created by Isnard Silva on 06/01/21.
//

import XCTest
@testable import Mevents

final class CheckInViewModelTests: XCTestCase {
    // MARK: - Properties
    var sut: CheckInViewModel!
    
    
    // MARK: - Setup Methods
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    
    // MARK: Test Methods
    func testEmptyEmailError() {
        // Given
        sut = CheckInViewModel()
        
        // When
        XCTAssertThrowsError(try sut.setUserEmail("")) { error in
            // Then
            XCTAssertEqual(error as? CheckInError, .emptyEmail)
        }
    }
    
    func testEmptyUserNameError() {
        // Given
        sut = CheckInViewModel()
        
        // When
        XCTAssertThrowsError(try sut.setUserName("")) { error in
            // Then
            XCTAssertEqual(error as? CheckInError, .emptyUserName)
        }
    }
    
    func testEmptyEventId() throws {
        // Given
        let promise = expectation(description: "Call to save an Check In")
        sut = CheckInViewModel()
        try sut.setUserName("User")
        try sut.setUserEmail("user@mail.com")
        
        // When
        sut.checkIn(completionHandler: { error in
            // Then
            XCTAssertEqual(error as? CheckInError, .emptyEventId)
            promise.fulfill()
        })
        wait(for: [promise], timeout: 5)
    }
}
