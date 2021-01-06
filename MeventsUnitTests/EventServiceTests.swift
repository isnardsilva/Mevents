//
//  EventServiceTests.swift
//  MeventsUnitTests
//
//  Created by Isnard Silva on 05/01/21.
//

import XCTest
@testable import Mevents

final class EventServiceTests: XCTestCase {
    // MARK: - Properties
    var sut: EventService!
    
    
    // MARK: - Setup Methods
    override func setUp() {
        super.setUp()
        sut = EventService()
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
        
        // When
        sut.fetchEvents(completionHandler: { result in
            switch result {
            case .failure(let error):
                XCTFail(error.localizedDescription)
                
            case .success(let events):
                receivedResponse = events
            }
            
            promise.fulfill()
        })
        wait(for: [promise], timeout: 5)
        
        // Then
        XCTAssertNotNil(receivedResponse)
        if let validEvents = receivedResponse, validEvents.isEmpty {
            XCTFail("Event list is empty")
        }
    }
    
    func testCheckIn() {
        // Given
        let user = User(name: "User Test", email: "anyuser@mail.com")
        let eventId = "1"
        let promise = expectation(description: "Call to Check In to an event")
        
        // When
        sut.checkIn(eventId: eventId, user: user, completionHandler: { error in
            // Then
            XCTAssertNil(error)
            promise.fulfill()
        })
        wait(for: [promise], timeout: 5)
    }
}
