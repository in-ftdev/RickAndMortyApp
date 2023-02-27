//
//  RMRequest.swift
//  RickAndMortyApp
//
//  Created by Hai Nguyen on 08/02/2023.
//

import Foundation
final class RMRequest {
    
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    
    private let endpoint: RMEndpoint
    private let pathComponents: [String]
    private let queyParameters: [URLQueryItem]
    
    private var urlString: String {
        var string = Constants.baseUrl
        string += "/\(endpoint.rawValue)"
        
        if !pathComponents.isEmpty {
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        
        if !queyParameters.isEmpty {
            string += "?"
            
            let argumentString = queyParameters.compactMap({
                guard let value = $0.value else {
                    return nil
                }
                
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            
            string += argumentString
        }
        
        return string
    }
    
    public var url: URL? {
        return URL(string: urlString)
    }
    
    public let httpMethod = "GET"
    
    init(
        endpoint: RMEndpoint,
        pathComponents: [String] = [],
        queyParameters: [URLQueryItem] = []
    ) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queyParameters = queyParameters
    }
    
}

extension RMRequest {
    static let listCharactersRequests = RMRequest(endpoint: .character)
}
