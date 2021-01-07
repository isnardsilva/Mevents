//
//  EventServiceInfo.swift
//  Mevents
//
//  Created by Isnard Silva on 05/01/21.
//

import Foundation

enum EventServiceInfo {
    case fetchEvents
    case checkIn(_ checkIn: CheckIn)
}


// MARK: - Service Protocol
extension EventServiceInfo: ServiceProtocol {
    var path: String {
        switch self {
        case .fetchEvents:
            return EventAPISources.baseURL + EventAPISources.eventsExtensionURL
            
        case .checkIn:
            return EventAPISources.baseURL + EventAPISources.checkInExtensionURL
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .fetchEvents:
            return .GET
        case .checkIn:
            return .POST
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .fetchEvents:
            return nil
            
        case .checkIn(let checkIn):
            return [
                EventAPISources.ParameterName.eventId: checkIn.eventId,
                EventAPISources.ParameterName.name: checkIn.userName,
                EventAPISources.ParameterName.email: checkIn.userEmail
            ]
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}
