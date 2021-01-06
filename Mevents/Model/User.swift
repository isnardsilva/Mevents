//
//  User.swift
//  Mevents
//
//  Created by Isnard Silva on 06/01/21.
//

import Foundation

struct User {
    // MARK: - Properties
    let id: String
    let name: String
    let email: String
    
    
    // MARK: - Initialization
    init(id: String = UUID().uuidString, name: String, email: String) {
        self.id = id
        self.name = name
        self.email = email
    }
}