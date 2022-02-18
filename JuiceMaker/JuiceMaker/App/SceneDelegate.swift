//
//  JuiceMaker - SceneDelegate.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  
  var window: UIWindow?
  var coordinator: MainCoordinator?
  
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    
    guard let windowScene = (scene as? UIWindowScene) else { return }
    
    let navigationController = UINavigationController()
    let fruitStore = FruitStore(qauntity: 10)
    let juiceMaker = JuiceMaker(fruitStore: fruitStore)
    coordinator = MainCoordinator(navigationController: navigationController, juiceMaker: juiceMaker, fruitStore: fruitStore)
    coordinator?.start()

    window = UIWindow(windowScene: windowScene)
    window?.rootViewController = navigationController
    window?.makeKeyAndVisible()
  }
}

