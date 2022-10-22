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
        let feedViewController = UINavigationController(rootViewController: FeedViewController())
        // заглушка второй кнопки на tabBar
        let secondViewController = UINavigationController(rootViewController: ProfileViewController())
        // экраны view
        feedViewController.tabBarItem.image = UIImage(systemName: "house")
        feedViewController.tabBarItem.title = "Feed"
        // кнопки tabBar
        secondViewController.tabBarItem.image = UIImage(systemName: "person")
        secondViewController.tabBarItem.title = "Profile"
        
        tabBar.backgroundColor = .systemBackground
        tabBar.tintColor = .systemBlue
        
        viewControllers = [
            feedViewController,
            secondViewController
        ]
    }
}
