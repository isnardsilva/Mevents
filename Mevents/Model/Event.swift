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
//    - id
//    - title
//    - description
//    - price
//    - latitude
//    - longitude
//    - date (Ver como tratar)
//    - checkIn: Bool = false
}
