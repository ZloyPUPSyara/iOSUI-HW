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
        let imageView = UIImageView(frame: CGRect(x: 16, y: 16, width: 110, height: 110))
        imageView.image = UIImage(named: "Evelynn_0")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = imageView.frame.size.width/2
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        let imageViewHeight = imageView.frame.size.height
        return imageView
    }()
    
    let profileLabele: UILabel = {
        let profileLabel = UILabel()
        profileLabel.translatesAutoresizingMaskIntoConstraints = false
        profileLabel.text = "Evelynn"
        profileLabel.font = UIFont.boldSystemFont(ofSize: 18)
        return profileLabel
    }()
  
    private func setupLabel() {
        profileLabele.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 25).isActive = true
        profileLabele.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 11).isActive = true
        profileLabele.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/2).isActive = true
        profileLabele.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private lazy var statusButton: UIButton = {
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        let imageViewHeight = imageView.bounds.height
        let statusButton = UIButton(frame: CGRect(x: 16, y: imageViewHeight + 32, width: screenWidth - 32, height: 50))
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
        let statusField = UITextField(frame: CGRect(x: imageViewWidth + 41, y: buttonHieght + 34, width: 300, height: 30))
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
        setupLabel()
        profileHeader.addSubview(statusButton)
        profileHeader.addSubview(statusField)
    }


}
