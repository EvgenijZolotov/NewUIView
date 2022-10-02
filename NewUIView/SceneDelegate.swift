//
//  SceneDelegate.swift
//  NewUIView
//
//  Created by Evgenij Zolotov on 10/2/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        // прописываем сцену запуска гловного экрана
        setupRootViewController(windowScene: windowScene)
    }
    
    func setupRootViewController(windowScene: UIWindowScene) {
        let window = UIWindow(windowScene: windowScene)
        let viewController = TabBarController()
        let navigationViewControler = UINavigationController(
            rootViewController: viewController
        )
        window.rootViewController = navigationViewControler
        window.makeKeyAndVisible()
        self.window = window
    }
}

