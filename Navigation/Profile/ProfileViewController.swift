//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Юлия on 30.04.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func viewWillLayoutSubviews() {
        let profileHeader = ProfileHeaderView()
        view.addSubview(profileHeader)
        profileHeader.backgroundColor = .lightGray
        profileHeader.frame = view.safeAreaLayoutGuide.layoutFrame

    }
}
