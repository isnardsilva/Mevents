//
//  UserDefaultsManagerError.swift
//  Mevents
//
//  Created by Isnard Silva on 06/01/21.
//

import Foundation

enum UserDefaultsManagerError: Error {
    case unableToEncode
    case noValue
    case unableToDecode
}

// MARK: - LocalizedError
extension UserDefaultsManagerError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .unableToEncode:
            return "Não foi possível codificar esse objeto."
        case .noValue:
            return "Não foi encontrado nenhum valor no User Defaults."
        case .unableToDecode:
            return "Não foi possível decodificar esse objeto."
        }
    }
}
