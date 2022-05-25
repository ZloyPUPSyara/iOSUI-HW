//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Юлия on 24.05.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    private let imageCollectionCell: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCollectionCell(_ post: CollectionModel){
        imageCollectionCell.image = post.image
    }
    
    private func layout(){
        contentView.addSubview(imageCollectionCell)
        NSLayoutConstraint.activate([
            imageCollectionCell.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageCollectionCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageCollectionCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageCollectionCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            ])
    }
}
