//
//  RMGetAllCharacteresResponse.swift
//  RickyMortyApp
//
//  Created by MACBOOK PRO M1  on 22/08/2025.
//

import Foundation

struct RMGetAllCharacteresResponse: Codable{
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    let info: Info
    let results: [RMCharactere]
}
