//
//  URLSessionManager.swift
//  Mevents
//
//  Created by Isnard Silva on 05/01/21.
//

import Foundation

/// Implementação do URL Session para fazer a conexão com recursos disponíveis na Web
class URLSessionManager: NetworkManagerProtocol {
    func request(service: ServiceProtocol, completionHandler: @escaping (Result<Data, NetworkError>) -> Void) {
        
        // Format URL
        guard let validURL = self.formatURL(service: service) else {
            completionHandler(.failure(.invalidURL))
            return
        }
        
        // Setup Request Type
        let urlRequest = self.setupURLRequest(url: validURL, service: service)
        
        // Run Request
        URLSession.shared.dataTask(with: urlRequest, completionHandler: { data, response, error in
            // Check offline error or unknow erros
            if let detectedError = error as NSError? {
                if detectedError.code == NSURLErrorDataNotAllowed {
                    completionHandler(.failure(.offline))
                } else {
                    completionHandler(.failure(.unknowError))
                }
                return
            }
            
            // Check status code
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                completionHandler(.failure(.connectionError))
                return
            }
            
            // Check response type
            guard let mimeType = response?.mimeType,
                  mimeType == HTTPResponseType.JSON.rawValue else {
                completionHandler(.failure(.invalidResponseType))
                return
            }
            
            // Check data
            guard let receivedData = data else {
                completionHandler(.failure(.responseWithoutData))
                return
            }
            
            completionHandler(.success(receivedData))
        }).resume()
    }
}


// MARK: - Setup URL
extension URLSessionManager {
    private func formatURL(service: ServiceProtocol) -> URL? {
        // Create URL
        guard var urlComponents = URLComponents(string: service.path) else {
            return nil
        }
        
        // Add Parameters
        if let receivedParameters = service.parameters {
            urlComponents.queryItems = []
            
            for parameter in receivedParameters {
                let queryItem = URLQueryItem(name: parameter.key, value: String(describing: parameter.value))
                urlComponents.queryItems?.append(queryItem)
            }
        }
        
        return urlComponents.url
    }
    
    private func setupURLRequest(url: URL, service: ServiceProtocol) -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = service.method.rawValue
        
        if let headers = service.headers {
            for header in headers {
                urlRequest.setValue(header.value, forHTTPHeaderField: header.key)
            }
        }
        
        return urlRequest
    }
}
