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
    private let pathComponents: Set<String>
    private let queyParameters: [URLQueryItem]
    
    private var urlString: String {
        var string = Constants.baseUrl
        string += "/\(endpoint.rawValue)"
        
        if !pathComponents.isEmpty {
            //            pathComponents.forEach { each in
            //                string += "/\(each)"
            //            }
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
            
            
            //            let argumentString = queyParameters.compactMap( { urlQueryItem in
            //                guard let value = urlQueryItem.value else {
            //                    return nil
            //                }
            //                return "\(urlQueryItem.name)=\(value)"
            //            }).joined(separator: "&")
            
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
        pathComponents: Set<String> = [],
        queyParameters: [URLQueryItem] = []
    ) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queyParameters = queyParameters
    }
    
}
