//
//  RMCharacterCollectionViewCellViewModel.swift
//  RickyMortyApp
//
//  Created by MACBOOK PRO M1  on 22/08/2025.
//

import Foundation

class RMCharacterCollectionViewCellViewModel{
    
    private let characterImageUrl: URL?
    public let characterName: String
    private let characterStatus: RMCharactereStatus
    
    init(
        characterImageUrl: URL?,
        characterName: String,
        characterStatus: RMCharactereStatus
    ){
        self.characterImageUrl = characterImageUrl
        self.characterName = characterName
        self.characterStatus = characterStatus
    }
    
    public var characterStatusString: String{
        return "Status: \(characterStatus.text)"
    }
    public func fetchImage(completion: @escaping (Result<Data, Error>) -> Void){
        guard let url = characterImageUrl else {
            completion(.failure(URLError(.badURL)))
            return
        }
        
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }
            completion(.success(data))
        }
        task.resume()
        
    }
    
}
