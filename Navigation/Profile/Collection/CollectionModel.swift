//
//  CillectionModel.swift
//  Navigation
//
//  Created by Юлия on 24.05.2022.
//

import UIKit

struct CollectionModel {
    let image: UIImage?
    
    static func makeArrayPhotos() -> [CollectionModel]{
        var collectionPhotos = [CollectionModel]()
        for element in 0...19 {
            collectionPhotos.append(CollectionModel(image: UIImage(named: "\(element)")))
        }
        return collectionPhotos
    }
}
