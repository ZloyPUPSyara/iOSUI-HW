//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Юлия on 02.05.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Evelynn_0")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 55
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()

    lazy var profileLabele: UILabel = {
        let profileLabel = UILabel()
        profileLabel.text = "Evelynn"
        profileLabel.font = UIFont.boldSystemFont(ofSize: 18)
        
        profileLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return profileLabel
    }()

    lazy var statusButton: UIButton = {
        let statusButton = UIButton()
        statusButton.addTarget(self, action: #selector(tapStatusButtonAction), for: .touchUpInside)
        statusButton.backgroundColor = .black
        statusButton.layer.cornerRadius = 20
        statusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        statusButton.layer.shadowRadius = 4
        statusButton.layer.shadowColor = UIColor.black.cgColor
        statusButton.layer.shadowOpacity = 0.7
        statusButton.setTitle("Проверить статус", for: .normal)
        
        statusButton.translatesAutoresizingMaskIntoConstraints = false
        
        return statusButton
    }()
   @objc private func tapStatusButtonAction() {
       statusField.text = "А вот и я"
   }

    lazy var statusField: UITextField = {
        let statusField = UITextField()
        statusField.text = "Тут что-то должно появиться"
        statusField.textColor = .darkGray
        
        statusField.translatesAutoresizingMaskIntoConstraints = false
        
       return statusField
    }()

    private func layout() {

        [imageView, profileLabele, statusButton, statusField] .forEach{addSubview($0)}
        
        NSLayoutConstraint.activate([
            
//setup image
            
            imageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            imageView.widthAnchor.constraint(equalToConstant: 110),
            imageView.heightAnchor.constraint(equalToConstant: 110),
            
//setup label
            
            profileLabele.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 11),
            profileLabele.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 20),
            profileLabele.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/2),
            
// setup button
            
            statusButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            statusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            statusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            statusButton.heightAnchor.constraint(equalToConstant: 50),
            
// setup text
            
            statusField.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -34),
            statusField.leadingAnchor.constraint(equalTo: profileLabele.leadingAnchor),
            statusField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
            ])
    }
}
