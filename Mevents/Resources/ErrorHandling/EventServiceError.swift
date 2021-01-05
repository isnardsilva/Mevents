//
//  EventServiceError.swift
//  Mevents
//
//  Created by Isnard Silva on 05/01/21.
//

import Foundation

enum EventServiceError: Error {
    case objectNotDecoded
}


extension EventServiceError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .objectNotDecoded:
            return "Não foi possível decodificar os dados."
        }
    }
}
