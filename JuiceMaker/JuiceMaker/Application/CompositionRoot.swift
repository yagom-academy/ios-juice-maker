//
//  CompositionRoot.swift
//  JuiceMaker
//
//  Created by 조민호 on 2022/03/08.
//

import UIKit

final class CompositionRoot {
    struct Dependency {
        let fruitStore: FruitStore
        let juiceMaker: JuiceMaker
        
        let juiceMakerViewController: JuiceMakerViewController
        let modifyingViewController: ModifyingStockViewController
        
        let navigationController: UINavigationController
    }
    
    func resolve() -> Dependency {
        let defaultFruitAmount = Fruit.configureDefaultFruits()
        let fruitStore = FruitStore(stocks: defaultFruitAmount)
        let juiceMaker = JuiceMaker(fruitStore: fruitStore)
        
        let juiceMakerViewController = JuiceMakerViewController.instance(juiceMaker: juiceMaker, modifyingStockViewControllerable: self)
        let modifyingViewController = ModifyingStockViewController.instance(fruitStore: fruitStore)
        
        let navigationController = UINavigationController(rootViewController: juiceMakerViewController)

        return Dependency(
            fruitStore: fruitStore,
            juiceMaker: juiceMaker,
            juiceMakerViewController: juiceMakerViewController,
            modifyingViewController: modifyingViewController,
            navigationController: navigationController
        )
    }
    
    func setWindow(window: UIWindow, dependency: Dependency) {
        window.rootViewController = dependency.navigationController
        window.makeKeyAndVisible()
    }
}
