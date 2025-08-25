//
//  RMCharacterCollectionViewCell.swift
//  RickyMortyApp
//
//  Created by MACBOOK PRO M1  on 22/08/2025.
//

import UIKit

class RMCharacterCollectionViewCell: UICollectionViewCell {
    
    let identifier = "RMCharacterCollectionViewCell"
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        return label
    }()
    
    let statusLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUplayer()
        contentView.addSubviews(imageView, nameLabel, statusLabel)
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func prepareForReuse() {
        imageView.image = nil
        nameLabel.text = nil
        statusLabel.text = nil
    }
    private func setUplayer(){
        backgroundColor = .secondarySystemBackground
        layer.cornerRadius = 8
        layer.shadowColor = UIColor.systemGray.cgColor
        layer.shadowOpacity = 0.4
        layer.shadowOffset = CGSize(width: -4, height: 4)
        self.imageView.layer.cornerRadius = 8
    }
    private func  setUpConstraints(){
        NSLayoutConstraint.activate([
            statusLabel.heightAnchor.constraint(equalToConstant: 30),
            statusLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 7),
            statusLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -7),
            statusLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -3),
            
            nameLabel.heightAnchor.constraint(equalToConstant: 30),
            nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 7),
            nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -7),
            nameLabel.bottomAnchor.constraint(equalTo: statusLabel.topAnchor, constant: -3),
            
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -7),
            imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            
        ])
        
    }
    func configure(with viewModel: RMCharacterCollectionViewCellViewModel) {
        self.nameLabel.text = viewModel.characterName
        self.statusLabel.text = viewModel.characterStatusString
        viewModel.fetchImage { result in
            switch result{
            case .success(let data):
                DispatchQueue.main.async(execute: {
                    let image = UIImage(data: data)
                    self.imageView.image = image
                })
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
       
    }
}
