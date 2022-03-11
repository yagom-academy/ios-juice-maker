//
//  JuiceMaker - SceneDelegate.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    private let compositionRoot: CompositionRoot
    var window: UIWindow?
    
    private override init() {
        self.compositionRoot = CompositionRoot()
    }

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let window = window else { return }
        guard let _ = (scene as? UIWindowScene) else { return }

        let dependencies: CompositionRoot.Dependency = compositionRoot.resolve()
        compositionRoot.setWindow(window: window, dependency: dependencies)
    }

    func sceneDidDisconnect(_ scene: UIScene) {}
    func sceneDidBecomeActive(_ scene: UIScene) {}
    func sceneWillResignActive(_ scene: UIScene) {}
    func sceneWillEnterForeground(_ scene: UIScene) {}
    func sceneDidEnterBackground(_ scene: UIScene) {}
}

