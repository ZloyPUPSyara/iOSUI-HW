//
//  LogInViewController.swift
//  Navigation
//
//  Created by Юлия on 09.05.2022.
//

import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {
    
    private let nc = NotificationCenter.default
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .white
        return contentView
    }()
    
    lazy var logInImage: UIImageView = {
        let logInImage = UIImageView()
        logInImage.image = UIImage(named: "logo")
        logInImage.translatesAutoresizingMaskIntoConstraints = false
        return logInImage
    }()
    
    lazy var emailTextField: UITextField = {
        let emailTextField = UITextField()
        emailTextField.layer.backgroundColor = UIColor.systemGray6.cgColor
        emailTextField.layer.borderWidth = 0.5
        emailTextField.layer.borderColor = UIColor.lightGray.cgColor
        emailTextField.layer.cornerRadius = 10
        emailTextField.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner] //скрываю нижнее скругление
        emailTextField.placeholder = "Email or phone"
        emailTextField.textColor = .black
        emailTextField.font = UIFont.systemFont(ofSize: 16)
        emailTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: emailTextField.frame.height))
        emailTextField.leftViewMode = .always
        emailTextField.autocapitalizationType = .none
        emailTextField.delegate = self
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        return emailTextField
    }()
    
    lazy var passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.layer.backgroundColor = UIColor.systemGray6.cgColor
        passwordTextField.layer.borderWidth = 0.5
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner] //скрываю верхнее скругление
        passwordTextField.placeholder = "Password"
        passwordTextField.textColor = .black
        passwordTextField.font = UIFont.systemFont(ofSize: 16)
        passwordTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: passwordTextField.frame.height))
        passwordTextField.leftViewMode = .always
        passwordTextField.autocapitalizationType = .none
        passwordTextField.delegate = self
        passwordTextField.isSecureTextEntry = true
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        return passwordTextField
    }()
    
    lazy var logInButton: UIButton = {
        let logInButton = UIButton()
        logInButton.addTarget(self, action: #selector(tapLogInAction), for: .touchUpInside)
        logInButton.backgroundColor = UIColor(rgb: 0x4885CC)
        logInButton.layer.cornerRadius = 10
        logInButton.setTitle("Log In", for: .normal)
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        return logInButton
    }()
    
    @objc func tapLogInAction() {
        let profileVC = ProfileViewController()
        navigationController?.pushViewController(profileVC, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layoutLogInView()
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nc.addObserver(self, selector: #selector(kbdShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.addObserver(self, selector: #selector(kbdHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        nc.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        navigationController?.isNavigationBarHidden = false
    }
    
    @objc private func kbdShow(notification: NSNotification) {
        if let kbdSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = kbdSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: kbdSize.height, right: 0)
        }
    }
    
    @objc private func kbdHide() {
        scrollView.contentInset = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
    
    private func layoutLogInView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        [logInImage, emailTextField, passwordTextField, logInButton].forEach{contentView.addSubview($0)}
        
        NSLayoutConstraint.activate([
            
//scrollView
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
//contentView
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
//logInImage
            logInImage.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 120),
            logInImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logInImage.widthAnchor.constraint(equalToConstant: 100),
            logInImage.heightAnchor.constraint(equalToConstant: 100),
            
//emailTextField
            emailTextField.topAnchor.constraint(equalTo: logInImage.bottomAnchor, constant: 120),
            emailTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            emailTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),

//passwordTextField
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
//logInButton
            logInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            logInButton.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            logInButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

// MARK: - UITextFieldDelegate

extension LogInViewController: UITextViewDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}

// MARK: - UIColor Hex-code
extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}
