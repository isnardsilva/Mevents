//
//  EventViewModelTests.swift
//  MeventsUnitTests
//
//  Created by Isnard Silva on 06/01/21.
//

import XCTest
@testable import Mevents

final class EventViewModelTests: XCTestCase {
    // MARK: - Properties
    var sut: EventViewModel!
    
    
    // MARK: - Setup Methods
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    
    // MARK: - Test Methods
    func testContainsValidAttributes() throws {
        // Given
        let events = try JSONTranslation().translateToObject(path: "events.json", to: [Event].self)
        let event = try XCTUnwrap(events.first)
        
        // When
        let eventViewModel = EventViewModel(event: event)
        
        // Then
        XCTAssertEqual(eventViewModel.id, event.id)
        XCTAssertEqual(eventViewModel.title, event.title)
        XCTAssertEqual(eventViewModel.description, event.description)
        XCTAssertEqual(eventViewModel.image, event.image)
        XCTAssertEqual(eventViewModel.price, event.price)
        XCTAssertEqual(eventViewModel.formattedPrice, "R$ \(event.price)")
        XCTAssertEqual(eventViewModel.latitude, event.latitude)
        XCTAssertEqual(eventViewModel.longitude, event.longitude)
        XCTAssertEqual(eventViewModel.date, event.date)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        XCTAssertEqual(eventViewModel.formattedDate, dateFormatter.string(from: event.date))
    }
}
