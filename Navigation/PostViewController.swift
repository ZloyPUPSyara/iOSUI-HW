//
//  PostViewController.swift
//  Navigation
//
//  Created by Юлия on 30.04.2022.
//

import UIKit

struct Post {
    var title: String
    
    init (title: String) {
        self.title = title
    }
}

class PostViewController: UIViewController {
    
    var post: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        makeBarItem()

    }
    let image = UIImage(systemName: "gearshape")
    private func makeBarItem() {
        let barItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(tapAction))
        navigationItem.rightBarButtonItem = barItem
    }

   @objc private func tapAction() {
        let infoVC = InfoViewController()
       present(infoVC, animated: true)
       
    }
}
