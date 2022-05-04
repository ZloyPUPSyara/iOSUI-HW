//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Юлия on 02.05.2022.
//

import UIKit

class ProfileHeaderView: UIView {
        
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height

    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 16, y: 16, width: 100, height: 100)
        imageView.image = UIImage(named: "Evelynn_0")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        return imageView
    }()

    let profileLabele: UILabel = {
        let profileLabel = UILabel()
        profileLabel.frame = CGRect(x: 146, y: 27, width: 100, height: 30)
        profileLabel.text = "Evelynn"
        profileLabel.font = UIFont.boldSystemFont(ofSize: 18)
        return profileLabel
    }()

    var statusButton: UIButton = {
       let statusButton = UIButton()
        let screenWidth = UIScreen.main.bounds.width
        statusButton.frame = CGRect(x: 16, y: 132, width: screenWidth - 32, height: 50)
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
       statusField.text = "А вот и я"
   }

    lazy var statusField: UITextField = {
        let statusField = UITextField()
        let screenWidth = UIScreen.main.bounds.width
        statusField.frame = CGRect(x: 146, y: 68, width: screenWidth - 162, height: 30)
        statusField.text = "Тут что-то должно появиться"
        statusField.textColor = .darkGray
       return statusField
    }()

    override func layoutSubviews() {
        imageView.layer.cornerRadius = imageView.bounds.width / 2

        [imageView, profileLabele, statusButton, statusField] .forEach{addSubview($0)}
    }
}
