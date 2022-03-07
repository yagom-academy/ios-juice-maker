//
//  CompositionRoot.swift
//  JuiceMaker
//
//  Created by 김태현 on 2022/03/07.
//

import UIKit

extension SceneDelegate {
//    let defaultFruitAmount = Fruit.configureDefaultFruits()
//    let fruitStore = FruitStore(stocks: defaultFruitAmount)
//    let juiceMaker = JuiceMaker(fruitStore: fruitStore)
//
//    let juiceMakerViewController = JuiceMakerViewController.instance(juiceMaker: juiceMaker)
//    let navigationController = UINavigationController(rootViewController: juiceMakerViewController)
//
//    window?.rootViewController = navigationController
//    window?.makeKeyAndVisible()
    
    func registerDependencies() {
        let defaultFruitAmount = Fruit.configureDefaultFruits()
        
        CompositionContainer.shared.register(FruitStore(stocks: defaultFruitAmount))
        
        let fruitStore: FruitStore = CompositionContainer.shared.resolve()
        
        CompositionContainer.shared.register(JuiceMaker(fruitStore: fruitStore))
        
        let juiceMaker: JuiceMaker = CompositionContainer.shared.resolve()
        
        CompositionContainer.shared.register(JuiceMakerViewController.instance(juiceMaker: juiceMaker))
        CompositionContainer.shared.register(ModifyingStockViewController.instance(fruitStore: fruitStore))
        
        let juiceMakerViewController: JuiceMakerViewController = CompositionContainer.shared.resolve()
        
        CompositionContainer.shared.register(UINavigationController(rootViewController: juiceMakerViewController))
        
        let navigationController: UINavigationController = CompositionContainer.shared.resolve()
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
