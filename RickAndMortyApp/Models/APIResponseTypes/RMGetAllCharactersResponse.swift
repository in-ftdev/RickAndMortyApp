//
//  RMGetAllCharactersResponse.swift
//  RickAndMortyApp
//
//  Created by Hai Nguyen on 27/02/2023.
//

import Foundation

struct RMGetAllCharatersResponse: Codable {
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    
    let info: Info
    let results: [RMCharacter]
}


