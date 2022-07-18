//
//  ClientManager.swift
//  Pokemon
//
//  Created by Arjun on 18/07/22.
//

import Foundation


/// Custom Validation error
enum ValidationError: Error {
    case invalidServerResponse
    case invalidResposeModel
    case invalidUrl
    case Offline
    case entityDataNotFound
    
}

/// Mnage API response
public enum ResponseManager<T> {
    case offline
    case success(T)
    case error(Error)
}

extension URLRequest {
    
    /// Request header
       mutating func addCommonHeaders() {
           self.setValue("application/json", forHTTPHeaderField: "Content-Type")
           self.setValue("application/json", forHTTPHeaderField: "Accept")
       }
}

/// Manage API request
final class ClientManager {
    
    /// Request type
    private enum RequestType: String {
        case GET
        case POST
        case PUT
    }
    
    /// Manage GET request
    /// - Parameter url: url
    /// - Returns: URLRequest
    static func GET(_ url: String) throws -> URLRequest {
        
        if url.isEmpty {
            throw ValidationError.invalidUrl
        }
        
        let requestUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        guard let serviceUrl = URL(string: requestUrl) else { throw ValidationError.invalidUrl }
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = RequestType.GET.rawValue
        request.cachePolicy = .reloadIgnoringCacheData
        
        return request
    }

}
