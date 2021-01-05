//
//  EventViewModel.swift
//  Mevents
//
//  Created by Isnard Silva on 05/01/21.
//

import Foundation

class EventViewModel {
    // MARK: - Properties
    private let event: Event
    
    /*
     let id: String
     let title: String
     let description: String
     let image: String
     let price: Double
     let latitude: Double
     let longitude: Double
     */
    
    var id: String {
        return event.id
    }
    
    var title: String {
        return event.title
    }
        
    var description: String {
        return event.description
    }
    
    var image: String {
        return event.image
    }
    
    var price: Double {
        return event.price
    }
    
    var formattedPrice: String {
        return String(format: "R$ %.02f", event.price)
    }
    
    var latitude: Double {
        return event.latitude
    }
    
    var longitude: Double {
        return event.longitude
    }
    
    var date: Date {
        return event.date
    }
    
    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: event.date)
    }
    
    
    
    // MARK: - Initialization
    init(event: Event) {
        self.event = event
    }
}
