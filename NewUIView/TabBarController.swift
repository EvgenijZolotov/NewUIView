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
        let logInViewController = LogInViewController()
        
        let navFeedViewController = UINavigationController(rootViewController: feedViewController)
        
        // заглушка второй кнопки на tabBar UIViewController
        let navLogInViewController = UINavigationController(rootViewController: logInViewController)
        // экраны view
        feedViewController.tabBarItem.image = UIImage(systemName: "house")
        feedViewController.tabBarItem.title = "Feed"
        // кнопки tabBar
        logInViewController.tabBarItem.image = UIImage(systemName: "person")
        logInViewController.tabBarItem.title = "Profile"
        
        tabBar.backgroundColor = .systemBackground
        tabBar.tintColor = .systemBlue
        
        viewControllers = [
            navFeedViewController,
            navLogInViewController
        ]
    }
}
