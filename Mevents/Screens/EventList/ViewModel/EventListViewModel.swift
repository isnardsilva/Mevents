//
//  EventListViewModel.swift
//  Mevents
//
//  Created by Isnard Silva on 05/01/21.
//

import Foundation

class EventListViewModel {
    // MARK: - Properties
    private let eventService = EventService()
    private(set) var events: [Event]
    
    var didReceiveEvents: (() -> Void)?
    var didReceiveError: ((Error) -> Void)?
    
    
    // MARK: - Initialization
    init(events: [Event] = []) {
        self.events = events
    }
}


// MARK: - Service Calls
extension EventListViewModel {
    func fetchEvents() {
        eventService.fetchEvents(completionHandler: { [weak self] result in
            switch result {
            case .failure(let error):
                self?.didReceiveError?(error)
                
            case .success(let receivedEvents):
                self?.events = receivedEvents
                self?.didReceiveEvents?()
            }
        })
    }
}
