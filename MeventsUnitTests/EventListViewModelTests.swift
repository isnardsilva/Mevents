//
//  EventListViewModelTests.swift
//  MeventsUnitTests
//
//  Created by Isnard Silva on 05/01/21.
//

import XCTest
@testable import Mevents

final class EventListViewModelTests: XCTestCase {
    // MARK: - Properties
    var sut: EventListViewModel!
    
    
    // MARK: - Setup Methods
    override func setUp() {
        super.setUp()
        sut = EventListViewModel()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    
    // MARK: - Test Methods
    func testFetchEvents() {
        // Given
        let promise = expectation(description: "Fetch Event in a call to Event API")
        var receivedResponse: [Event]?
        
        sut.didReceiveEvents = { [weak self] in
            receivedResponse = self?.sut.events
            promise.fulfill()
        }
        
        sut.didReceiveError = { error in
            XCTFail(error.localizedDescription)
            promise.fulfill()
        }
        
        // When
        sut.fetchEvents()
        wait(for: [promise], timeout: 5)
    
        // Then
        XCTAssertNotNil(receivedResponse)
        if let validEvents = receivedResponse, validEvents.isEmpty {
            XCTFail("Event list is empty")
        }
    }
}
