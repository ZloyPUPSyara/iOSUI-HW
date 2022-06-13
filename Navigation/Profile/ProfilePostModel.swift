//
//  ProfilePostModel.swift
//  Navigation
//
//  Created by Юлия on 22.05.2022.
//

import UIKit

struct PostModel{
    let author: String
    let description: String?
    let image: UIImage?
    var likes: Int
    var views: Int
    
    static func makePostModel() -> [PostModel] {
        var post = [PostModel]()
        post.append(PostModel(author: "Evelinn 1", description: "some description some description some description some description some description some description some description some description some description some description some description some description some description some description some description some description some description some description some description some description some description some description some descriptions ome descriptionsome description some descriptionsome descriptionsome descriptionHELLO", image: UIImage(named: "League-of-Legends-фэндомы-Ashe-Ahri-6814581"), likes: 0, views: 0))
        post.append(PostModel(author: "Evelinn 2", description: "some description", image: UIImage(named: "lol-liga-legend-shadow-evelynn-oboi-2560x1440_51"), likes: 0, views: 0))
        post.append(PostModel(author: "Evelinn 3", description: "some description", image: UIImage(named: "League_of_Legends_Riot_Games_sugar_Evelynn_League_of_Legends_Evelynn_braum_braum_shield_Ziggs-1723139.jpg!d"), likes: 0, views: 0))
        post.append(PostModel(author: "Evelinn 4", description: "some description", image: UIImage(named: "Evelynn-League-Of-Legends-Official-Artwork"), likes: 0, views: 0))
        return post
    }
}
