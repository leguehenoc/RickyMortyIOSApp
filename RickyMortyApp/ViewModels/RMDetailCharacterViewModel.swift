//
//  RMDetailCharacterViewModel.swift
//  RickyMortyApp
//
//  Created by MACBOOK PRO M1  on 25/08/2025.
//

import UIKit

class RMDetailCharacterViewModel{
    let character: RMCharactere
    init(character: RMCharactere ){
        self.character = character
    }
    
    public var title: String {
        return character.name.uppercased()
    }
}
