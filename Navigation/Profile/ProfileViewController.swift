//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Юлия on 30.04.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let profileHeader = ProfileHeaderView()
    
    private func layout() {
        profileHeader.translatesAutoresizingMaskIntoConstraints = false
        
        profileHeader.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        profileHeader.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        profileHeader.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        profileHeader.heightAnchor.constraint(equalToConstant: 700).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        profileHeader.backgroundColor = .lightGray
        view.addSubview(profileHeader)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        profileHeader.frame = view.safeAreaLayoutGuide.layoutFrame
        layout()
    }

}
