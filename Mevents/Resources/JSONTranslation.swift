//
//  JSONTranslation.swift
//  Mevents
//
//  Created by Isnard Silva on 06/01/21.
//

import Foundation

class JSONTranslation {
    
//    func request<T: Decodable>(service: ServiceProtocol, responseType: T.Type, completionHandler: @escaping (Result<T, NetworkError>) -> Void)
    func translateToObject<T: Decodable>(path: String, to objectType: T.Type) throws -> T {
        let bundle = Bundle(for: type(of: self))
        let pathWithouFormat = path.replacingOccurrences(of: ".json", with: "")
        
        // Check path
        guard let url = bundle.path(forResource: pathWithouFormat, ofType: ".json") else {
            throw JSONTranslationError.invalidPath
        }
        
        // Check content
        guard let data = NSData(contentsOfFile: url) as Data? else {
            throw JSONTranslationError.invalidData
        }
        
        let decodedObject = try self.translateToObject(data: data, to: objectType)
        
        return decodedObject
    }
    
    func translateToObject<T: Decodable>(data: Data, to objectType: T.Type) throws -> T {
        guard let decodedObject = try? JSONDecoder().decode(objectType, from: data) else {
            throw JSONTranslationError.objectNotDecoded
        }
        
        return decodedObject
    }
}
