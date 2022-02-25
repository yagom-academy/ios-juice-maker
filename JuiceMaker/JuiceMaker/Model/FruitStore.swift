//
//  JuiceMaker - FruitStore.swift
//  Created by Doogie & Malrang. 
//  Copyright © yagom academy. All rights reserved.
//
class FruitStore {
    var fruitList = [Fruits: Int]()
    
    init() {
        let defaultStock = 10
        Fruits.allCases.forEach{ self.fruitList[$0] = defaultStock }
    }
    
    func minusStock(menu: Menu) throws {
        for (ingredent, amount) in menu.recipie {
            guard let stock = fruitList[ingredent] else {
                throw FruitStoreError.invalidSelection
            }
            fruitList[ingredent] = stock - amount
        }
    }
    
    func calculateStock(fruit: Fruits, amount: Int, calculationType: CalculationType) throws {
        guard let stock = fruitList[fruit] else {
            throw FruitStoreError.invalidSelection
        }
        if calculationType == .plus {
            fruitList[fruit] = stock + amount
        } else {
            guard stock >= amount else {
                throw FruitStoreError.outOfStock
            }
            fruitList[fruit] = stock - amount
        }
    }
}
