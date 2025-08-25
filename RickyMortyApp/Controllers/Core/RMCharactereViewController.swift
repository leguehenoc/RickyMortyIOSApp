//
//  RMCharactereViewController.swift
//  RickyMortyApp
//
//  Created by MACBOOK PRO M1  on 21/08/2025.
//

import UIKit
import FirebaseAnalytics

class RMCharactereViewController: UIViewController, rmCharacterListViewDelegate {
    
    
    
    let characterView = CharacterListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Charactere"
        self.characterView.delegate = self
        view.addSubview(characterView)
        characterView.translatesAutoresizingMaskIntoConstraints = false
        
        navigationItem.largeTitleDisplayMode = .automatic
       
        NSLayoutConstraint.activate([
            characterView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            characterView.leftAnchor.constraint(equalTo: view.leftAnchor),
            characterView.rightAnchor.constraint(equalTo: view.rightAnchor),
            characterView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        
        Analytics.logEvent(AnalyticsEventScreenView,
                           parameters: [AnalyticsParameterScreenName: "Charactere Screen Select",
                                       AnalyticsParameterScreenClass: "RMCharactereViewController"])
    }
    
    func rmCharacterListView(_ view: CharacterListView, didSelectCharacter character: RMCharactere) {
        let viewModel = RMDetailCharacterViewModel(character: character)
        let vc = RMDetailCharacterViewController(viewModel: viewModel)
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
