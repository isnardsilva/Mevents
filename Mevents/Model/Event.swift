//
//  Event.swift
//  Mevents
//
//  Created by Isnard Silva on 05/01/21.
//

import Foundation

struct Event: Codable {
    let id: String
    let title: String
    let description: String
    let image: String
    let price: Double
    let latitude: Double
    let longitude: Double
    
    private let timeIntervalDate: Double
    var date: Date {
        return Date(timeIntervalSince1970: timeIntervalDate)
    }
    
    // MARK: - Parse
    private enum CodingKeys: String, CodingKey {
        case id, title, description, image, price, latitude, longitude
        case timeIntervalDate = "date"
    }
}
