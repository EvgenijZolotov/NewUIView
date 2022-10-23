//
//  LogInViewController.swift
//  NewUIView
//
//  Created by Evgenij Zolotov on 10/22/22.
//

import UIKit


final class LogInViewController: UIViewController {
    
    private let logoImage: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "logo")
        imageView.image = image
        return imageView
    }()
    
    // emeilTextField
    private let mailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email and phone"
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.backgroundColor = .systemGray6
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 16)
        // вкл или отк автокоррекции во время набора текста
        textField.autocorrectionType = .no
        return textField
    }()
    
    // passwordTextField
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.backgroundColor = .systemGray6
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 16)
        // вкл или отк автокоррекции во время набора текста
        textField.autocorrectionType = .no
        // скрытие вводного текста
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let authStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.layer.cornerRadius = 10
        stackView.clipsToBounds = true
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.borderWidth = 0.5
        stackView.spacing = 0
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var logInButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "backgroundLoginButton")
        button.setTitle("Log In", for: .normal)
        button.titleLabel?.textColor = .white
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(logInButtonPressed), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Action
    @objc
    private func logInButtonPressed() {
        logInButton.pushAnimate {
            let viewController = ProfileViewController()
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
        
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @objc
    func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height / 2.5
            }
        }
    }
    
    @objc
    func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    private func setupViewController() {
        view.backgroundColor = .white
        // скрываем navigationBar
        navigationController?.navigationBar.isHidden = true
        addSubview()
        setupConstraint()
    }
    
    private func addSubview() {
        authStackView.addArrangedSubview(mailTextField)
        authStackView.addArrangedSubview(passwordTextField)
        
        view.addSubviews(logoImage, authStackView, logInButton)
    }
    
    func setupConstraint() {
        
        NSLayoutConstraint.activate([
            logoImage.heightAnchor.constraint(equalToConstant: 100),
            logoImage.widthAnchor.constraint(equalToConstant: 100),
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120),
            
            authStackView.heightAnchor.constraint(equalToConstant: 100),
            authStackView.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 120),
            authStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            authStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.topAnchor.constraint(equalTo: authStackView.bottomAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            logInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
    }
}
