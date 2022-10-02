//
//  ProfileViewController.swift
//  NewUIView
//
//  Created by Evgenij Zolotov on 10/2/22.
//

import UIKit

final class ProfileViewController: UIViewController {
    // созд элемента
    private lazy var profileHeaderView: ProfileHeaderView = {
        let view = ProfileHeaderView()
        // отк маску
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }

    private func setupViewController() {
        view.backgroundColor = .yellow
        addSubView()
        setupConstraint()
    }

    private func addSubView() {
        // доб элем на view
        view.addSubview(profileHeaderView)
    }

    func setupConstraint() {
        NSLayoutConstraint.activate([
            // наложене слоя
            profileHeaderView.topAnchor.constraint(equalTo: view.topAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeaderView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
}
