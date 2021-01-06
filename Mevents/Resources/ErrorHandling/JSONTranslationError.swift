//
//  JSONTranslationError.swift
//  Mevents
//
//  Created by Isnard Silva on 06/01/21.
//

import Foundation

enum JSONTranslationError: Error {
    case invalidPath
    case invalidData
    case objectNotDecoded
    case objectNotEcoded
}


// MARK: - LocalizedError
extension JSONTranslationError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidPath:
            return "Não foi encontrado nenhum arquivo no caminho especificado."
        case .invalidData:
            return "Houve um erro ao tentar ler os dados especificados."
        case .objectNotDecoded:
            return "Não foi possível decodificar o objeto."
        case .objectNotEcoded:
            return "Não foi possível codificar o objeto."
        }
    }
}
