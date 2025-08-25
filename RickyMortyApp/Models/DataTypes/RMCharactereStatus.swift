//
//  RMCharactereStatus.swift
//  RickyMortyApp
//
//  Created by MACBOOK PRO M1  on 21/08/2025.
//

import Foundation

enum RMCharactereStatus: String, Codable{
//    'Alive', 'Dead' or 'unknown'
    case alive = "Alive"
    case dead = "Dead"
    case `unknown` = "unknown"
    
    var text: String  {
        switch self {
        case .alive, .dead:
            return self.rawValue
        case .unknown:
            return "Unknown"
        }
    }
}
