//
//  EventServiceInfo.swift
//  Mevents
//
//  Created by Isnard Silva on 05/01/21.
//

import Foundation

enum EventServiceInfo {
    case fetchEvents
}


// MARK: - Service Protocol
extension EventServiceInfo: ServiceProtocol {
    var path: String {
        switch self {
        case .fetchEvents:
            return EventAPISources.baseURL + EventAPISources.eventsExtensionURL
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .fetchEvents:
            return .GET
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .fetchEvents:
            return nil
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}
