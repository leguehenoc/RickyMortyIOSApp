//
//  RMCaractere.swift
//  RickyMortyApp
//
//  Created by MACBOOK PRO M1  on 21/08/2025.
//

import Foundation

struct RMCharactere: Codable {
    let id: Int
    let name: String
    let status: RMCharactereStatus
    let species: String
    let type: String
    let gender: RMCharactereGender
    let origin: RMOrigin
    let location: RMSingleLocation
    let image: String
    let episode: [String]
    let url: String
    let created: String
}
