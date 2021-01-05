//
//  ServiceProtocol.swift
//  Mevents
//
//  Created by Isnard Silva on 05/01/21.
//

import Foundation

/// Gerencia uma série de dados importantes a serem preenchidos em uma requisição usando o protocolo HTTP
protocol ServiceProtocol {
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: [String: Any]? { get }
    var headers: [String: String]? { get }
}
