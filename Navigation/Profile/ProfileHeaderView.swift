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
        setupGestures()
        backgroundColor = .white
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var avatarImagePosition = imageView.layer.position
    private lazy var avatarImageBounds = imageView.layer.bounds
    
    private lazy var avatarView: UIView = {
        let avatarView = UIView()
        avatarView.backgroundColor = .black
        avatarView.isUserInteractionEnabled = false
        avatarView.alpha = 0.0
        avatarView.frame = UIScreen.main.bounds
        
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        
        return avatarView
    }()

    
    private lazy var closeImageButton: UIButton = {
        let closeImageButton = UIButton()
        closeImageButton.setImage(UIImage(systemName: "multiply.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 40))?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
        closeImageButton.alpha = 0.0
        closeImageButton.clipsToBounds = false
        closeImageButton.addTarget(self, action: #selector(closeImageAction), for: .touchUpInside)
        closeImageButton.isUserInteractionEnabled = false
        
        closeImageButton.translatesAutoresizingMaskIntoConstraints = false

        return closeImageButton
    }()
    
    

    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Evelynn_0")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 55
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.isUserInteractionEnabled = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()

    let profileLabele: UILabel = {
        let profileLabel = UILabel()
        profileLabel.text = "Evelynn"
        profileLabel.font = UIFont.boldSystemFont(ofSize: 18)
        
        profileLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return profileLabel
    }()

    var statusButton: UIButton = {
        let statusButton = UIButton()
        statusButton.addTarget(self, action: #selector(tapStatusButtonAction), for: .touchUpInside)
        statusButton.backgroundColor = .black
        statusButton.layer.cornerRadius = 20
        statusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        statusButton.layer.shadowRadius = 4
        statusButton.layer.shadowColor = UIColor.black.cgColor
        statusButton.layer.shadowOpacity = 0.7
        statusButton.setTitle("Установить статус", for: .normal)
        
        statusButton.translatesAutoresizingMaskIntoConstraints = false
        
        return statusButton
    }()

    lazy var statusField: UITextField = {
        let statusField = UITextField()
        statusField.text = "Тут что-то есть"
        statusField.textColor = .darkGray
        
        statusField.translatesAutoresizingMaskIntoConstraints = false
        
       return statusField
    }()
    
    var setStatusField: UITextField = {
        let setStatusField = UITextField()
        setStatusField.backgroundColor = .systemGray6
        setStatusField.layer.borderWidth = 0.5
        setStatusField.layer.borderColor = UIColor.gray.cgColor
        setStatusField.placeholder = "Add status"
        setStatusField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: setStatusField.frame.height))
        setStatusField.leftViewMode = .always
        
        setStatusField.translatesAutoresizingMaskIntoConstraints = false
        
        return setStatusField
    }()
    
    @objc private func closeImageAction() {
        UIView.animate(withDuration: 0.3,
                       delay: 0.0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 0.0,
                       options: .curveEaseInOut) {
            self.closeImageButton.alpha = 0
            self.closeImageButton.isUserInteractionEnabled = false
        } completion: { _ in
            UIView.animate(withDuration: 0.5,
                           delay: 0.0) {
                self.avatarView.alpha = 0.0
                self.imageView.layer.position = self.avatarImagePosition
                self.imageView.layer.bounds = self.avatarImageBounds
                self.imageView.layer.cornerRadius = self.imageView.bounds.width / 2
                self.imageView.layer.borderWidth = 3
                self.imageView.isUserInteractionEnabled = true
                self.statusButton.isUserInteractionEnabled = true
                self.statusField.isUserInteractionEnabled = true
                self.layoutIfNeeded()
            }
        }
    }
    
    @objc private func tapStatusButtonAction() {
        if setStatusField.text != "" {
            statusField.text = setStatusField.text
        } else {
            setStatusField.attributedPlaceholder = NSAttributedString(string: "Установите статус", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
        }
    }
    
    
// MARK: - Animation
    
    private func setupGestures() {
        let tapAvatarGesture = UITapGestureRecognizer(target: self, action: #selector(tapAvatarAction))
        imageView.addGestureRecognizer(tapAvatarGesture)
    }
    
    @objc func tapAvatarAction() {
        
        self.avatarImagePosition = self.imageView.layer.position
        self.avatarImageBounds = self.imageView.layer.bounds
        
        UIImageView.animate(withDuration: 0.5,
                            animations: {
            self.imageView.layer.position = CGPoint(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY - 70 ) 
            self.avatarView.alpha = 0.8
            self.imageView.layer.bounds = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
            self.imageView.layer.cornerRadius = 0
            self.imageView.layer.borderWidth = 0
            self.imageView.isUserInteractionEnabled = false
            self.statusButton.isUserInteractionEnabled = false
            self.statusField.isUserInteractionEnabled = false
        },
                            completion: { _ in
            UIImageView.animate(withDuration: 0.3) {
                self.closeImageButton.alpha = 1
                self.closeImageButton.isUserInteractionEnabled = true
                self.layoutIfNeeded()
            }
        })
    }
    
// MARK: - layout

    private func layout() {

        [profileLabele, statusButton, statusField, setStatusField, avatarView, imageView, closeImageButton] .forEach{addSubview($0)}
        
        NSLayoutConstraint.activate([
            
            closeImageButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            closeImageButton.topAnchor.constraint(equalTo: topAnchor),
            
            
//setup image
            
            imageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            imageView.widthAnchor.constraint(equalToConstant: 110),
            imageView.heightAnchor.constraint(equalToConstant: 110),
            
//setup label
            
            profileLabele.topAnchor.constraint(equalTo: self.topAnchor, constant: 27),
            profileLabele.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16),
            profileLabele.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/2),
            
// setup button
            
            statusButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            statusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            statusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            statusButton.heightAnchor.constraint(equalToConstant: 50),
            statusButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            
// setup text
            
            statusField.topAnchor.constraint(equalTo: profileLabele.bottomAnchor, constant: 16),
            statusField.leadingAnchor.constraint(equalTo: profileLabele.leadingAnchor),
            statusField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
//setup textfield
            
            setStatusField.topAnchor.constraint(equalTo: statusField.bottomAnchor, constant: 16),
            setStatusField.leadingAnchor.constraint(equalTo: profileLabele.leadingAnchor),
            setStatusField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            ])
    }
}
