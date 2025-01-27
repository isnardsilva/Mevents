//
//  EventService.swift
//  Mevents
//
//  Created by Isnard Silva on 05/01/21.
//

import Foundation

/// Obtem os dados dos eventos que estão armazenados na núvem
final class EventService {
    // MARK: - Properties
    private let networkManager: NetworkManagerProtocol
    
    
    // MARK: - Initialization
    init(networkManager: NetworkManagerProtocol = URLSessionManager()) {
        self.networkManager = networkManager
    }
    
    
    // MARK: - Service Methods
    func fetchEvents(completionHandler: @escaping (Result<[Event], Error>) -> Void) {
        let service = EventServiceInfo.fetchEvents
        
        networkManager.request(service: service, completionHandler: { result in
            switch result {
            case .failure(let error):
                completionHandler(.failure(error))
                
            case .success(let data):
                guard let decodedObject = try? JSONDecoder().decode([Event].self, from: data) else {
                    completionHandler(.failure(EventServiceError.objectNotDecoded))
                    return
                }
                
                completionHandler(.success(decodedObject))
            }
        })
    }
    
    func checkIn(_ checkIn: CheckIn, completionHandler: @escaping (Error?) -> Void) {
        let service = EventServiceInfo.checkIn(checkIn)
        
        networkManager.request(service: service, completionHandler: { result in
            switch result {
            case .failure(let error):
                completionHandler(error)
            case .success:
                completionHandler(nil)
            }
        })
    }
}
