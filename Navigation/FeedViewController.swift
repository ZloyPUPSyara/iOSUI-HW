//
//  ViewController.swift
//  Navigation
//
//  Created by Юлия on 27.04.2022.
//

import UIKit


class FeedViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
        postButton()
    }
    
    private func postButton() {
        let post = UIButton(frame: CGRect(x: 0, y: 0, width: 350, height: 300))
        post.center = view.center
        post.setTitle("post", for: .normal)
        post.backgroundColor = .black
        post.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        view.addSubview(post)
    }
    @objc private func tapAction() {
         let postVC = PostViewController()
        postVC.navigationItem.title = post.title
       
        navigationController?.pushViewController(postVC, animated: true)
    }
    let post = Post(title: "Post")
}

