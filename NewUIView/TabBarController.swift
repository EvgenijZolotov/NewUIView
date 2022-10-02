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
        let feedViewController = FeedViewController()
        let profileViewController = ProfileViewController()
        
        feedViewController.tabBarItem.image = UIImage(systemName: "house")
        feedViewController.tabBarItem.title = "Feed"
        
        profileViewController.tabBarItem.image = UIImage(systemName: "person")
        profileViewController.tabBarItem.title = "Profile"
        
        tabBar.backgroundColor = .systemBackground
        tabBar.tintColor = .systemBlue
        
        viewControllers = [
            feedViewController,
            profileViewController
        ]
    }
}
