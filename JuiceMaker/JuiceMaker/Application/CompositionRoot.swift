//
//  CompositionRoot.swift
//  JuiceMaker
//
//  Created by 조민호 on 2022/03/08.
//

import UIKit

final class CompositionRoot {
    static let shared = CompositionRoot()
    
    struct Dependency {
        let fruitStore: FruitStore
        let juiceMaker: JuiceMaker
        
        let juiceMakerViewController: JuiceMakerViewController
        let navigationController: UINavigationController
    }
    
    @discardableResult
    func resolve(window: UIWindow) -> Dependency {
        let defaultFruitAmount = Fruit.configureDefaultFruits()
        let fruitStore = FruitStore(stocks: defaultFruitAmount)
        let juiceMaker = JuiceMaker(fruitStore: fruitStore)
        
        let juiceMakerViewController = JuiceMakerViewController.instance(juiceMaker: juiceMaker)
        let navigationController = UINavigationController(rootViewController: juiceMakerViewController)
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        return Dependency(
            fruitStore: fruitStore,
            juiceMaker: juiceMaker,
            juiceMakerViewController: juiceMakerViewController,
            navigationController: navigationController
        )
    }
}
