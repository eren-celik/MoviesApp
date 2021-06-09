//
//  AppContainer.swift
//  Movies App
//
//  Created by Eren  Çelik on 9.06.2021.
//

import UIKit

final class AppRouter {
    
    let window : UIWindow
    
    init() {
        window = UIWindow(frame: UIScreen.main.bounds)
    }
    
    func start(windowScene: UIWindowScene) {
        let viewController = MainViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.windowScene = windowScene
        window.makeKeyAndVisible()
    }
    
}
