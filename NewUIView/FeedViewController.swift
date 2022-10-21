//
//  FeedViewController.swift
//  NewUIView
//
//  Created by Evgenij Zolotov on 10/2/22.
//

import UIKit

final class FeedViewController: UIViewController {
    
    private lazy var buttonOne: UIButton = {
        let button = UIButton(type: .system)
    //    let image = UIImage(systemName: "list.bullet.rectangle.portrait")
        button.setTitle("Button one", for: .normal)
        button.addTarget(self, action: #selector(buttonOnePressed), for: .touchUpInside)
        button.backgroundColor = .blue
        button.titleLabel?.font = .systemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var buttonTwo: UIButton = {
        let buttonTwo = UIButton(type: .system)
     //   let image = UIImage(systemName: "person.bust")
        buttonTwo.setTitle("Button two", for: .normal)
        buttonTwo.addTarget(self, action: #selector(buttonTwoPressed), for: .touchUpInside)
        buttonTwo.backgroundColor = .red
        buttonTwo.titleLabel?.font = .systemFont(ofSize: 18)
        buttonTwo.setTitleColor(.white, for: .normal)
        buttonTwo.layer.masksToBounds = true
        buttonTwo.layer.cornerRadius = 12
        buttonTwo.translatesAutoresizingMaskIntoConstraints = false
        return buttonTwo
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    @objc
    private func buttonOnePressed() {
        let viewController = ProfileViewController()
        present(viewController, animated: true)
        
        // отображение что кнопка работает
        //print(#function)
    }
    
    @objc
    private func buttonTwoPressed() {
        let viewController = ProfileViewController()
        navigationController?.pushViewController(viewController, animated: true)
        //print(#function)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
    // для повторного отображения viewController на экране
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    // при уходе с экрана каждый раз
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        tabBarController?.tabBar.isHidden = true
    }

    private func setupViewController() {
        view.backgroundColor = .systemPurple
        self.title = "FeedViewController"
        addSubView()
        setupConstraint()
    }

    private func addSubView() {
        stackView.addArrangedSubview(buttonOne)
        stackView.addArrangedSubview(buttonTwo)
        view.addSubview(stackView)
    }

    func setupConstraint() {
        
        NSLayoutConstraint.activate([
            buttonOne.heightAnchor.constraint(equalToConstant: 50),
            buttonOne.widthAnchor.constraint(equalToConstant: 100 ),
            
            buttonTwo.heightAnchor.constraint(equalToConstant: 50),
            buttonTwo.widthAnchor.constraint(equalToConstant: 100),
            
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

