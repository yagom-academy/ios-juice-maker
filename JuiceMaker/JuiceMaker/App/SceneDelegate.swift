//
//  JuiceMaker - SceneDelegate.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  
  var window: UIWindow?
  
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
    guard let windowScene = (scene as? UIWindowScene),
          let orderViewController = mainStoryBoard.instantiateViewController(withIdentifier: "OrderViewController") as? OrderViewController
    else { return }
    
    let fruitStore = FruitStore()
    let juiceMaker = JuiceMaker(fruitStore: fruitStore)
    let orderViewModel = OrderViewModel(juiceMaker: juiceMaker)
    
    orderViewController.viewModel = orderViewModel
    
    let navigationController = UINavigationController(rootViewController: orderViewController)
    window = UIWindow(windowScene: windowScene)
    window?.rootViewController = navigationController
    window?.makeKeyAndVisible()
  }
}

