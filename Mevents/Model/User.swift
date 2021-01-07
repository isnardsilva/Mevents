//
//  User.swift
//  Mevents
//
//  Created by Isnard Silva on 06/01/21.
//

import Foundation

struct User: Codable {
    // MARK: - Properties
    let id: String
    var name: String
    var email: String
    
    
    // MARK: - Initialization
    init(id: String = UUID().uuidString, name: String, email: String) {
        self.id = id
        self.name = name
        self.email = email
    }
}
