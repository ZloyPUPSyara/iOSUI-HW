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
        
        NSLayoutConstraint.activate([
            profileHeader.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeader.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeader.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeader.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
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
