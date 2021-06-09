//
//  SceneDelegate.swift
//  Movies App
//
//  Created by Eren  Çelik on 9.06.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        app.router.start(windowScene: windowScene)
    }
}

