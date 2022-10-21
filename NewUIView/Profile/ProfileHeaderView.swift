//
//  ProfileHeaderView.swift
//  NewUIView
//
//  Created by Evgenij Zolotov on 10/2/22.
//

import UIKit

final class ProfileHeaderView: UIView {
    
    private lazy var avatarImageView: UIImageView = {
        let avatarImageView = UIImageView()
        let image = UIImage(named: "Cat in Boots")
        avatarImageView.image = image
        // скруглить картинку
        avatarImageView.layer.cornerRadius = 60
        // окантовка картинки
        avatarImageView.layer.borderWidth = 2
        avatarImageView.layer.borderColor = UIColor.green.cgColor
        avatarImageView.layer.masksToBounds = true
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        return avatarImageView
    }()
    
    private lazy var fullNameLabel: UILabel = {
        let fullNameLabel = UILabel()
        fullNameLabel.text = "Hipster Cat"
        fullNameLabel.font = UIFont(name: "bolt", size: 18)
        fullNameLabel.backgroundColor = .lightGray
        fullNameLabel.textAlignment = .center
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return fullNameLabel
    }()
    
    private lazy var statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.text = "Listening to music"
        statusLabel.textColor = .systemGray
        statusLabel.font = UIFont(name: "bolt", size: 14)
      //  labelTwo.backgroundColor = .lightGray
        statusLabel.textAlignment = .left
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        return statusLabel
    }()
    
    private lazy var setStatusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Show status", for: .normal)
        button.addTarget(self, action: #selector(setStatusButtonPressed), for: .touchUpInside)
        button.backgroundColor = .systemBlue
        button.titleLabel?.font = .systemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let statusTextField: UITextField = {
        let statusTextField = UITextField()
        statusTextField.font = UIFont(name: "font", size: 15)
        statusTextField.placeholder = "Waiting for something..."
        statusTextField.backgroundColor = .white
        statusTextField.textColor = .gray
        statusTextField.textAlignment = .left
        statusTextField.layer.cornerRadius = 12
        statusTextField.layer.masksToBounds = true
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        return statusTextField
    }()
    
    @objc
    private func setStatusButtonPressed() {
        statusLabel.text = statusTextField.text
        // очищаем историю ввода
        statusTextField.text = ""
        statusTextField.endEditing(true)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewController()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViewController() {
        backgroundColor = .lightGray
        addSubView()
        setupConstraint()
    }
    
    private func addSubView() {
        addSubview(avatarImageView)
        addSubview(fullNameLabel)
        addSubview(setStatusButton)
        addSubview(statusTextField)
        addSubview(statusLabel)
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            
            avatarImageView.widthAnchor.constraint(equalToConstant: 120),
            avatarImageView.heightAnchor.constraint(equalToConstant: 120),
            avatarImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            
            fullNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 34),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            setStatusButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
            
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            statusTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            statusTextField.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 34),
            
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            statusLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            statusLabel.bottomAnchor.constraint(equalTo: statusTextField.topAnchor, constant: -6)
        ])
    }
}


