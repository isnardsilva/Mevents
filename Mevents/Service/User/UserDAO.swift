//
//  UserDAO.swift
//  Mevents
//
//  Created by Isnard Silva on 06/01/21.
//

import Foundation

/// Fornece o armazenamento local das informações do usuário
class UserDAO {
    // MARK: - Properties
    private let userDefaultsManager = UserDefaultsManager()
    
    
    // MARK: - CRUD Methods
    func saveUser(user: User) throws {
        do {
            try userDefaultsManager.saveObject(user, forKey: Identifier.Database.userInfoKey)
        } catch {
            throw error
        }
    }
    
    func getUser() throws -> User {
        do {
            let user = try userDefaultsManager.getObject(forKey: Identifier.Database.userInfoKey, castTo: User.self)
            return user
        } catch {
            throw error
        }
    }
}
