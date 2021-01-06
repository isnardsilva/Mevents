//
//  EventServiceInfo.swift
//  Mevents
//
//  Created by Isnard Silva on 05/01/21.
//

import Foundation

enum EventServiceInfo {
    case fetchEvents
    case checkIn(eventId: String, user: User)
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
            
        case .checkIn(let eventId, let user):
            return [
                EventAPISources.ParameterName.eventId: eventId,
                EventAPISources.ParameterName.name: user.name,
                EventAPISources.ParameterName.email: user.email
            ]
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}
