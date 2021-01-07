//
//  CheckInError.swift
//  Mevents
//
//  Created by Isnard Silva on 06/01/21.
//

import Foundation

enum CheckInError: Error {
    case emptyEventId
    case emptyUserName
    case emptyEmail
    case invalidEmail
}


// MARK: -
extension CheckInError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .emptyEventId:
            return "Não foi inserido o id de nenhum evento."
        case .emptyUserName:
            return "Por favor, insira o seu nome."
        case .emptyEmail:
            return "Por favor, insira o seu e-mail."
        case .invalidEmail:
            return "Por favor, insira um e-mail válido."
        }
    }
}
