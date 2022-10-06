//
//  ProfileViewController.swift
//  NewUIView
//
//  Created by Evgenij Zolotov on 10/2/22.
//

import UIKit

final class ProfileViewController: UIViewController {
    // созд элемента
    private let profileHeaderView = ProfileHeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        profileHeaderView.frame = view.bounds
    }
    
    private func setupViewController() {
        title = "Profile"
        addSubView()
    }

    private func addSubView() {
        // доб элем на view
        view.addSubview(profileHeaderView)
    }
}
