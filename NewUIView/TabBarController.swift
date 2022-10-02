//
//  TabBarController.swift
//  NewUIView
//
//  Created by Evgenij Zolotov on 10/2/22.
//

import UIKit

final class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }

    private func setupViewController() {
        view.backgroundColor = .green
        addSubView()
        setupConstraint()
    }

    private func addSubView() {

    }

    func setupConstraint() {

    }
}
