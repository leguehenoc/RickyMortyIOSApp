//
//  RMCharacterListViewViewModel.swift
//  RickyMortyApp
//
//  Created by MACBOOK PRO M1  on 22/08/2025.
//

import Foundation
import UIKit

protocol RMCharacterListViewViewModelDelegate: AnyObject {
    func didLoadInitialCharacters()
    func didSelectCharacter(character: RMCharactere)
}

class CharacterListViewViewModel: NSObject  {
    
    weak var delegate: RMCharacterListViewViewModelDelegate?
    
    private var characters: [RMCharactere] = []{
        didSet{
            self.characters.forEach({ character in
                let viewModel = RMCharacterCollectionViewCellViewModel(characterImageUrl: URL(string: character.image), characterName: character.name, characterStatus: character.status)
                self.cellViewModels.append(viewModel)
            })
        }
    }
    
    private var cellViewModels: [RMCharacterCollectionViewCellViewModel] = []
    public func fetchCharacters()  {
        let request = RMRequest(endPoint: .character)
        
        RMService.shared.execute(request, execption: RMGetAllCharacteresResponse.self ) { [weak self]   result  in
            switch result{
            case .success(let data):
                let result = data.results
                self?.characters = result
                DispatchQueue.main.async(execute: {
                    self?.delegate?.didLoadInitialCharacters()
                })
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}
extension CharacterListViewViewModel: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  self.cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RMCharacterCollectionViewCell().identifier, for: indexPath) as? RMCharacterCollectionViewCell else{
            fatalError("Unsupported Cell")
        }
        cell.configure(with:self.cellViewModels[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width-30)/2
        let height = width * 1.5
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.didSelectCharacter(character:  self.characters[indexPath.row])
    }
}
