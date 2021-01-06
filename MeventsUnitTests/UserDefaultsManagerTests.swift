//
//  UserDefaultsManagerTests.swift
//  MeventsUnitTests
//
//  Created by Isnard Silva on 06/01/21.
//

import XCTest
@testable import Mevents

final class UserDefaultsManagerTests: XCTestCase {
    // MARK: - Properties
    var sut: UserDefaultsManager!
    let objectKeyToSave = "myObject"
    
    
    // MARK: - Setup Methods
    override func setUp() {
        super.setUp()
        sut = UserDefaultsManager()
    }
    
    override func tearDown() {
        sut = nil
        UserDefaults.standard.removeObject(forKey: objectKeyToSave)
        super.tearDown()
    }
    
    
    // MARK: - Test Methods
    func testSaveObject() {
        // Given
        let user = User(name: "User", email: "user@mail.com")
        
        // When/Then
        XCTAssertNoThrow(try sut.saveObject(user, forKey: objectKeyToSave))
        XCTAssertNotNil(UserDefaults.standard.object(forKey: objectKeyToSave))
    }
    
    func testGetObject() throws {
        // Given
        let user = User(name: "User", email: "user@mail.com")
        try sut.saveObject(user, forKey: objectKeyToSave)
        
        // When
        let savedObject = try sut.getObject(forKey: objectKeyToSave, castTo: User.self)
        
        // Then
        XCTAssertNotNil(savedObject)
    }
}
