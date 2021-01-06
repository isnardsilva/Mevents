//
//  CheckInViewModel.swift
//  Mevents
//
//  Created by Isnard Silva on 06/01/21.
//

import Foundation

final class CheckInViewModel {
    // MARK: - Properties
    private let eventService = EventService()
    private var userName: String?
    private var userEmail: String?
    private var eventId: String?
    
    
    // MARK: - Initialization
    init(checkIn: CheckIn? = nil) {
        self.eventId = checkIn?.eventId
        self.userName = checkIn?.userName
        self.userEmail = checkIn?.userEmail
    }
}


// MARK: - Input Methods
extension CheckInViewModel {
    func setUserName(_ userName: String) throws {
        if userName.isEmpty {
            throw CheckInError.emptyUserName
        }
        
        self.userName = userName
    }
    
    func setUserEmail(_ userEmail: String) throws {
        if userEmail.isEmpty {
            throw CheckInError.emptyEmail
        }
        
        self.userEmail = userEmail
    }
    
    func setEventId(_ eventId: String) {
        self.eventId = eventId
    }
    
    private func getCheckInEntered() throws -> CheckIn {
        guard let validEventId = self.eventId else {
            throw CheckInError.emptyEventId
        }
        
        guard let validUserName = self.userName else {
            throw CheckInError.emptyUserName
        }
        
        guard let validUserEMail = self.userEmail else {
            throw CheckInError.emptyEmail
        }
        
        let checkIn = CheckIn(eventId: validEventId, userName: validUserName, userEmail: validUserEMail)
        
        return checkIn
    }
}


// MARK: - Service Methods
extension CheckInViewModel {
    func checkIn(completionHandler: @escaping (Error?) -> Void) {
        do {
            let checkIn = try self.getCheckInEntered()
            
            eventService.checkIn(checkIn, completionHandler: { error in
                completionHandler(error)
            })
        } catch {
            completionHandler(error)
        }
    }
}

