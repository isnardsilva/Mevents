//
//  NetworkManagerProtocol.swift
//  Mevents
//
//  Created by Isnard Silva on 05/01/21.
//

import Foundation


/// Protocolo que determina o que a tecnologia que vai fazer a conexão entre o device e a web deve implementar
protocol NetworkManagerProtocol {
    /// Realiza uma request para um link específico na Internet
    func request(service: ServiceProtocol, completionHandler: @escaping (Result<Data, NetworkError>) -> Void)
}
