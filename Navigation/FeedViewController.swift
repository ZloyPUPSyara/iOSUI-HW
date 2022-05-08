//
//  ViewController.swift
//  Navigation
//
//  Created by Юлия on 27.04.2022.
//

import UIKit


class FeedViewController: UIViewController {
    
    private lazy var post: UIButton = {
        let post = UIButton(frame: CGRect(x: 0, y: 0, width: 350, height: 300))
        post.center = view.center
        post.setTitle("post", for: .normal)
        post.backgroundColor = .black
        post.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        return post
    }()
    
    private let postTitle = Post(title: "Post")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
        postButton()
    }
    
    private func postButton() {
        view.addSubview(post)
        post.center = view.center
    }
    
    @objc private func tapAction() {
         let postVC = PostViewController()
        postVC.navigationItem.title = postTitle.title
       
        navigationController?.pushViewController(postVC, animated: true)
    }
    
}

