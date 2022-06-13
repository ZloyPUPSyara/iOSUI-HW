//
//  CastomTableViewCell.swift
//  Navigation
//
//  Created by Юлия on 22.05.2022.
//

import UIKit

class CastomTableViewCell: UITableViewCell {
    
    var modelPostCounter = PostModel(author: "", description: "", image: UIImage(named:"League-of-Legends-фэндомы-Ashe-Ahri-6814581"), likes: 0, views: 0)

    private let postView: UIView = {
        let postView = UIView()
        postView.backgroundColor = .white
        postView.translatesAutoresizingMaskIntoConstraints = false
        return postView
    }()
    
    private let postImageView: UIImageView = {
        let postImageView = UIImageView()
        postImageView.backgroundColor = .black
        postImageView.contentMode = .scaleAspectFill
        postImageView.clipsToBounds = true
        postImageView.isUserInteractionEnabled = true
        postImageView.translatesAutoresizingMaskIntoConstraints = false
        return postImageView
    }()
    
    private let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        nameLabel.numberOfLines = 2
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    private let descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.textColor = .gray
        descriptionLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        return descriptionLabel
    }()
    
    private let likesLabel: UILabel = {
        let likesLabel = UILabel()
        likesLabel.font = UIFont.systemFont(ofSize: 16)
        likesLabel.isUserInteractionEnabled = true
        likesLabel.translatesAutoresizingMaskIntoConstraints = false
        return likesLabel
    }()
    
    let viewsLabel: UILabel = {
        let viewsLabel = UILabel()
        viewsLabel.font = UIFont.systemFont(ofSize: 16)
        viewsLabel.translatesAutoresizingMaskIntoConstraints = false
        return viewsLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
        setupGestures()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupGestures() {
        
        let tapLikeGesture = UITapGestureRecognizer(target: self, action: #selector(likeAction))
        likesLabel.addGestureRecognizer(tapLikeGesture)
        
    }
    
    @objc private func likeAction() {
        UIView.animate(withDuration: 0.5,
                       delay: 0.0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 0.0,
                       options: .curveEaseInOut) {
            
            self.modelPostCounter.likes += 1
            self.likesLabel.text = "Likes: \(self.modelPostCounter.likes)"
        }
    }
    
    func setupCell(_ model: PostModel) {
        postImageView.image = model.image
        nameLabel.text = model.author
        descriptionLabel.text = model.description
        likesLabel.text = "Likes: \(model.likes)"
        viewsLabel.text = "Views: \(model.views)"
    }
    
    private func layout() {
        [postView, postImageView, nameLabel, descriptionLabel, likesLabel, viewsLabel].forEach { contentView.addSubview($0) }
        
        let screenWidth = UIScreen.main.bounds.width
        
        NSLayoutConstraint.activate([
            postView.topAnchor.constraint(equalTo: contentView.topAnchor),
            postView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            postView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: postView.topAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: postView.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: postView.trailingAnchor, constant: -16),
            
            postImageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 12),
            postImageView.leadingAnchor.constraint(equalTo: postView.leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: postView.trailingAnchor),
            postImageView.heightAnchor.constraint(equalToConstant: screenWidth),
            
            descriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: postView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: postView.trailingAnchor, constant: -16),
            
            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            likesLabel.leadingAnchor.constraint(equalTo: postView.leadingAnchor, constant: 16),
            likesLabel.bottomAnchor.constraint(equalTo: postView.bottomAnchor, constant: -16),
            
            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            viewsLabel.trailingAnchor.constraint(equalTo: postView.trailingAnchor, constant: -16),
            viewsLabel.bottomAnchor.constraint(equalTo: postView.bottomAnchor, constant: -16)
            
            
        ])
    }
}
