//
//  FakeServiceInfo.swift
//  MeventsUnitTests
//
//  Created by Isnard Silva on 05/01/21.
//

import Foundation
@testable import Mevents

enum FakeServiceInfo {
    case getData
}

// MARK: - Service Protocol
extension FakeServiceInfo: ServiceProtocol {
    var path: String {
        switch self {
        case .getData:
            return "https://jsonplaceholder.typicode.com/todos/1"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getData:
            return .GET
        }
    }
    
    var parameters: [String : Any]? {
        return nil
    }
    
    var headers: [String : String]? {
        return nil
    }
}
