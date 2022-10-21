//
//  ProfileViewController.swift
//  NewUIView
//
//  Created by Evgenij Zolotov on 10/2/22.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("New title", for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.backgroundColor = .blue
        button.titleLabel?.font = .systemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc
    private func buttonPressed() {
        // отображение что кнопка работает
        print(#function)
    }
    
    // созд элемента
    private let profileHeaderView = ProfileHeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
    
//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//        profileHeaderView.frame = view.bounds
//    }
    
    private func setupViewController() {
        title = "Profile"
        view.backgroundColor = .gray
        addSubView()
        setupConstraint()
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        // скрыть tabBar
        tabBarController?.tabBar.isHidden = true
    }

    private func addSubView() {
        // доб элем на view
        view.addSubview(profileHeaderView)
        view.addSubview(button)
    }
    
    func setupConstraint() {
        
        NSLayoutConstraint.activate([
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
            
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
