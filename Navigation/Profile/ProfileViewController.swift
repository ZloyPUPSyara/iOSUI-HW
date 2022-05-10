//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Юлия on 30.04.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private lazy var profileHeader: ProfileHeaderView = {
        let profileHeader = ProfileHeaderView()
        profileHeader.frame = view.bounds
        profileHeader.backgroundColor = .lightGray
        return profileHeader
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func viewWillLayoutSubviews() {
        view.addSubview(profileHeader)

    }
}
