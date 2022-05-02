//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Юлия on 30.04.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let statusText = "а вот и я"
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Evelynn_0")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        return imageView
    }()
    
    let profileLabele: UILabel = {
        let profileLabel = UILabel()
        profileLabel.translatesAutoresizingMaskIntoConstraints = false
        profileLabel.text = "Evelynn"
        profileLabel.font = UIFont.boldSystemFont(ofSize: 18)
        return profileLabel
    }()
  
    private lazy var statusButton: UIButton = {
        let statusButton = UIButton()
        statusButton.translatesAutoresizingMaskIntoConstraints = false
        statusButton.addTarget(self, action: #selector(tapStatusButtonAction), for: .touchUpInside)
        statusButton.backgroundColor = .black
        statusButton.layer.cornerRadius = 20
        statusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        statusButton.layer.shadowRadius = 4
        statusButton.layer.shadowColor = UIColor.black.cgColor
        statusButton.layer.shadowOpacity = 0.7
        statusButton.setTitle("Проверить статус", for: .normal)
        return statusButton
    }()
    @objc private func tapStatusButtonAction() {
        statusField.text = statusText
    }
    
    lazy var statusField: UITextField = {
        let buttonHieght = statusButton.frame.height
        let imageViewWidth = imageView.bounds.width
        let statusField = UITextField()
        statusField.translatesAutoresizingMaskIntoConstraints = false
        statusField.text = "Тут что-то должно появиться"
        statusField.textColor = .darkGray
       return statusField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func viewWillLayoutSubviews() {
        let profileHeader = ProfileHeaderView()
        profileHeader.frame = view.safeAreaLayoutGuide.layoutFrame
        profileHeader.backgroundColor = .lightGray
        view.addSubview(profileHeader)
        profileHeader.addSubview(imageView)
        profileHeader.addSubview(profileLabele)
        profileHeader.addSubview(statusButton)
        profileHeader.addSubview(statusField)
        layoutSubviews()
    }
    
    private func layoutSubviews() {
        imageView.layer.cornerRadius = imageView.bounds.width / 2
        
        [imageView, profileLabele, statusButton, statusField] .forEach{ view.addSubview($0)}
        
        NSLayoutConstraint.activate([
            
    //setup image
            
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            imageView.widthAnchor.constraint(equalToConstant: 110),
            imageView.heightAnchor.constraint(equalToConstant: 110),
            
    //setup label
            
            profileLabele.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 11),
            profileLabele.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16),
            profileLabele.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/2),
            profileLabele.heightAnchor.constraint(equalToConstant: 50),
            
    // setup button
            
            statusButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            statusButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            statusButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
    // setup text
            
            statusField.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -34),
            statusField.leadingAnchor.constraint(equalTo: profileLabele.leadingAnchor),
            statusField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }

}
