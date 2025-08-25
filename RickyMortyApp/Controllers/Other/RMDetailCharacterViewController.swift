//
//  RMDetailCharacterViewController.swift
//  RickyMortyApp
//
//  Created by MACBOOK PRO M1  on 25/08/2025.
//

import UIKit

class RMDetailCharacterViewController: UIViewController {
    
    private var viewModel: RMDetailCharacterViewModel
    
    init(viewModel: RMDetailCharacterViewModel ){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.character.name
        navigationItem.largeTitleDisplayMode = .never
        view.backgroundColor = .systemBackground
        // Do any additional setup after loading the view.
    }
    
}
