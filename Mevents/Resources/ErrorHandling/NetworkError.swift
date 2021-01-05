//
//  NetworkError.swift
//  Mevents
//
//  Created by Isnard Silva on 05/01/21.
//

import Foundation


/// Conjunto de erros que podem ser tratados ao realizar uma conexão com um recurso na Web
enum NetworkError: Error {
    case invalidURL
    case offline
    case connectionError
    case responseWithoutData
    case invalidResponseType
    case unknowError
}

// MARK: - LocalizedError
extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "A URL passada é inválida."
        case .offline:
            return "Não há conexão com a internet."
        case .connectionError:
            return "Houve algum problema no processo de conexão com o servidor especificado."
        case .responseWithoutData:
            return "A resposta obtida do servidor não possui dados."
        case .invalidResponseType:
            return "O formato da resposta obtida do servidor é inválida."
        case .unknowError:
            return "Houve um error desconhecido. Tente novamente!"
        }
    }
}
