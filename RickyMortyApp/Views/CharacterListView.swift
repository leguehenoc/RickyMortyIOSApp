//
//  CharacterListView.swift
//  RickyMortyApp
//
//  Created by MACBOOK PRO M1  on 22/08/2025.
//

import UIKit
protocol rmCharacterListViewDelegate: AnyObject {
    func rmCharacterListView(_ view: CharacterListView, didSelectCharacter character: RMCharactere)
}

class CharacterListView: UIView {
    
    public weak var delegate: rmCharacterListViewDelegate?
    
    let viewModel = CharacterListViewViewModel()
    
    let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.startAnimating()
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    let uicollectionview: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
        let uicollectionview = UICollectionView(frame: .zero, collectionViewLayout: layout)
        uicollectionview.translatesAutoresizingMaskIntoConstraints = false
        uicollectionview.isHidden = true
        uicollectionview.alpha = 0
        uicollectionview.register(RMCharacterCollectionViewCell.self, forCellWithReuseIdentifier: RMCharacterCollectionViewCell().identifier)
        return uicollectionview
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        
        addSubviews(spinner, uicollectionview)
        self.viewModel.fetchCharacters()
        self.viewModel.delegate = self
        self.setUpConstraint()
        self.setUpCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstraint(){
        NSLayoutConstraint.activate([
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            uicollectionview.topAnchor.constraint(equalTo: topAnchor),
            uicollectionview.leftAnchor.constraint(equalTo: leftAnchor),
            uicollectionview.rightAnchor.constraint(equalTo: rightAnchor),
            uicollectionview.bottomAnchor.constraint(equalTo: bottomAnchor),
            
        ])
    }
    
    private func setUpCollectionView(){
        self.uicollectionview.delegate = viewModel
        self.uicollectionview.dataSource = viewModel
        
        
    }
}

extension CharacterListView: RMCharacterListViewViewModelDelegate{
    func didSelectCharacter(character: RMCharactere) {
        self.delegate?.rmCharacterListView(self, didSelectCharacter: character)
    }
    
    func didLoadInitialCharacters() {
        self.spinner.startAnimating()
        self.uicollectionview.isHidden = false
        self.uicollectionview.reloadData()
        
        UIView.animate(withDuration: 0.3, animations: {
            self.uicollectionview.alpha = 1
        })
    }
}
