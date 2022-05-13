//
//  JuiceMaker - FruitStore.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

final class FruitStore {
    private var fruits: Fruits = [:]
    
    init(strawberry: Int = 0, banana: Int = 0, kiwi: Int = 0, pineapple: Int = 0, mango: Int = 0) {
        self.fruits[.strawberry] = strawberry
        self.fruits[.banana] = banana
        self.fruits[.kiwi] = kiwi
        self.fruits[.pineapple] = pineapple
        self.fruits[.mango] = mango
        
        startObservingStock()
    }
    
    init(stock: Int) {
        for fruit in Fruit.allCases {
            self.fruits[fruit] = stock
        }
        startObservingStock()
    }
    
    var remainingStocks: Fruits {
        fruits
    }
    
    func pickUpFruits(for menu: FruitJuice) -> Result<FruitJuice, FruitError> {
        let recipe = menu.recipe
        guard hasEnoughFruits(for: recipe) else {
            return .failure(.insufficientFruit)
        }
        useFruits(for: recipe)
        return .success(menu)
    }
    
    private func hasEnoughFruits(for recipe: Fruits) -> Bool {
        for (fruit, stock) in fruits where stock < recipe[fruit] ?? 0 {
            return false
        }
        return true
    }
    
    private func useFruits(for recipe: Fruits) {
        for fruit in fruits.keys {
            fruits[fruit]? -= recipe[fruit] ?? 0
        }
    }
    
    private func startObservingStock() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(changeStock(notification:)),
            name: Notification.Name.fruitsTag,
            object: nil
        )
    }
    
    @objc func changeStock(notification: Notification) {
        guard let stocks = notification.userInfo?[Constant.userInfoKey] as? Fruits else {
            return
        }
        fruits = stocks
    }
}
