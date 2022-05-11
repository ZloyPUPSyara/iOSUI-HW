//
//  MainTabBarController.swift
//  Navigation
//
//  Created by Юлия on 30.04.2022.
//

import UIKit

class MainTabBarController: UITabBarController {

    let mainScreenVC = FeedViewController()
    let profileVC = LogInViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupControllers ()
        
    }
    
    private func setupControllers () {
        let mainscreenNC = UINavigationController(rootViewController: mainScreenVC)
        mainScreenVC.tabBarItem.title = "Лента"
        mainScreenVC.tabBarItem.image = UIImage(systemName: "house.fill")
        mainScreenVC.navigationItem.title = "Лента"
        
        let profileNC = UINavigationController(rootViewController: profileVC)
        profileVC.tabBarItem.title = "Профиль"
        profileVC.tabBarItem.image = UIImage(systemName: "person.circle.fill")
        profileVC.navigationItem.title = "Профиль"
        
        
        viewControllers = [mainscreenNC, profileNC]
    }

}
