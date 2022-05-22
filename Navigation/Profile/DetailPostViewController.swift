//
//  DetailPostViewController.swift
//  Navigation
//
//  Created by Юлия on 22.05.2022.
//

import UIKit

class DetailPostViewController: UIViewController {

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
        
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
        postImageView.translatesAutoresizingMaskIntoConstraints = false
        return postImageView
    }()
    
    private let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        nameLabel.numberOfLines = 2
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.text = "text label for post"
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
        likesLabel.translatesAutoresizingMaskIntoConstraints = false
        return likesLabel
    }()
    
    private let viewsLabel: UILabel = {
        let viewsLabel = UILabel()
        viewsLabel.font = UIFont.systemFont(ofSize: 16)
        viewsLabel.translatesAutoresizingMaskIntoConstraints = false
        return viewsLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = false
        layout()
    }
    
    func setupCell(_ model: PostModel) {
        postImageView.image = model.image
        nameLabel.text = model.author
        descriptionLabel.text = model.description
        likesLabel.text = "Likes: \(model.likes)"
        viewsLabel.text = "Views: \(model.views)"
    }
    
    private func layout() {
        view.addSubview(scrollView)
        scrollView.addSubview(postView)
        [postImageView, nameLabel, descriptionLabel, likesLabel, viewsLabel].forEach{ postView.addSubview($0) }
        
        let screenWidth = UIScreen.main.bounds.width
        
        NSLayoutConstraint.activate([
            
//scrollView
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            postView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            postView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            postView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            postView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            postView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: postView.topAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: postView.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: postView.trailingAnchor, constant: -16),
            
            postImageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 12),
            postImageView.leadingAnchor.constraint(equalTo: postView.leadingAnchor),
//            postImageView.trailingAnchor.constraint(equalTo: postView.trailingAnchor),
            postImageView.widthAnchor.constraint(equalToConstant: screenWidth),
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
