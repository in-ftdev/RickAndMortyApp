//
//  RMService.swift
//  RickAndMortyApp
//
//  Created by Hai Nguyen on 08/02/2023.
//

import Foundation
final class RMService {
    static let shared = RMService()
    
    private init(){}
    
    public func execute(_ request: RMRequest, completion: @escaping () -> Void) {
        
    }
    
}
