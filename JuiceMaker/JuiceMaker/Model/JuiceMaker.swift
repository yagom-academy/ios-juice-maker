//
//  JuiceMaker - JuiceMaker.swift
//  Created by riji, kaki
//  Copyright © yagom academy. All rights reserved.
//

struct JuiceMaker {
    static let sharedJuiceMaker = JuiceMaker()
    
    private init() {}
    
    private let fruitStore = FruitStore()
    
    func makeJuice(_ juiceMenu: JuiceMenu) throws {
        try checkCurrentStock(juiceMenu)
        for (fruit, stock) in juiceMenu.receipe {
            try fruitStore.subtractStock(of: fruit, amount: stock)
        }
    }
    
    func checkCurrentStock(_ juiceMenu: JuiceMenu) throws {
        for fruit in juiceMenu.receipe.keys {
            guard let requiredAmount = juiceMenu.receipe[fruit] else {
                throw JuiceMakerError.fruitError
            }
            guard let currentStock = fruitStore.fruitStocks[fruit] else {
                throw JuiceMakerError.fruitError
            }
            if currentStock < requiredAmount {
                throw JuiceMakerError.outOfStock
            }
        }
    }
    
    func currentFruitStock(of fruit: Fruit) -> String {
        guard let fruitStock = fruitStore.fruitStocks[fruit] else { return "" }
        return String(fruitStock)
    }
}


