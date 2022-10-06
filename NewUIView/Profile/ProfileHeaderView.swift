//
//  ProfileHeaderView.swift
//  NewUIView
//
//  Created by Evgenij Zolotov on 10/2/22.
//

import UIKit

final class ProfileHeaderView: UIView {
    
    private lazy var catImage: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "Cat in Boots")
        imageView.image = image
        // скруглить картинку
        imageView.layer.cornerRadius = 60
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var myLabel: UILabel = {
        let label = UILabel()
        label.text = "Hipster Cat"
        label.font = UIFont(name: "bolt", size: 18)
        label.backgroundColor = .lightGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var myLabelTwo: UILabel = {
        let labelTwo = UILabel()
        labelTwo.text = "Listening to music"
        labelTwo.textColor = .systemGray
        labelTwo.font = UIFont(name: "bolt", size: 14)
      //  labelTwo.backgroundColor = .lightGray
        labelTwo.textAlignment = .left
        labelTwo.translatesAutoresizingMaskIntoConstraints = false
        return labelTwo
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Show status", for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.backgroundColor = .systemBlue
        button.titleLabel?.font = .systemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let textField: UITextField = {
        let testField = UITextField()
        testField.font = UIFont(name: "font", size: 15)
        testField.placeholder = "Waiting for something..."
        testField.backgroundColor = .white
        testField.textColor = .gray
        testField.textAlignment = .left
        testField.layer.cornerRadius = 12
        testField.layer.masksToBounds = true
        testField.translatesAutoresizingMaskIntoConstraints = false
        return testField
    }()
    
    @objc
    private func buttonPressed() {
        myLabelTwo.text = textField.text
        // очищаем историю ввода
        textField.text = ""
        textField.endEditing(true)
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
        addSubview(catImage)
        addSubview(myLabel)
        addSubview(button)
        addSubview(textField)
        addSubview(myLabelTwo)
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            
            catImage.widthAnchor.constraint(
                equalToConstant: 120
            ),
            catImage.heightAnchor.constraint(
                equalToConstant: 120
            ),
            catImage.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16
            ),
            catImage.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor, constant: 16
            ),
            
            
            myLabel.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor, constant: 34
            ),
            myLabel.leadingAnchor.constraint(
                equalTo: catImage.trailingAnchor, constant: 16
            ),
            
            
            button.heightAnchor.constraint(
                equalToConstant: 50
            ),
            button.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16
            ),
            button.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16
            ),
            button.topAnchor.constraint(
                equalTo: catImage.bottomAnchor, constant: 16
            ),
            
            
            textField.heightAnchor.constraint(
                equalToConstant: 40
            ),
            textField.leadingAnchor.constraint(
                equalTo: catImage.trailingAnchor, constant: 16
            ),
            textField.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16
            ),
            textField.topAnchor.constraint(
                equalTo: myLabel.bottomAnchor, constant: 34
            ),
            
            
            myLabelTwo.leadingAnchor.constraint(
                equalTo: catImage.trailingAnchor, constant: 16
            ),
            myLabelTwo.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16
            ),
            myLabelTwo.bottomAnchor.constraint(
                equalTo: textField.topAnchor, constant: -6
            )
        ])
    }
}


