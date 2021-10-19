//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class FruitStore {
    let storedStrawberry: Fruit = Fruit(fruitName: .strawberry, count: 10)
    var storedBanana: Fruit = Fruit(fruitName: .banana, count: 10)
    var storedKiwi: Fruit = Fruit(fruitName: .kiwi, count: 10)
    var storedPineapple: Fruit = Fruit(fruitName: .pineapple, count: 10)
    var storedMango: Fruit = Fruit(fruitName: .mango, count: 10)
    
    func searchStorage(fruitNmae: Fruit.FruitName) -> Fruit {
        switch fruitNmae {
        case .strawberry:
            return storedStrawberry
        case .banana:
            return storedBanana
        case .kiwi:
            return storedKiwi
        case .pineapple:
            return storedPineapple
        case .mango:
            return storedMango
        }
    }
    
    func updateQuantity(changingFruit: Fruit) -> Bool {
        var isSuccess: Bool
        let changedFruit: Fruit = searchStorage(fruitNmae: changingFruit.name)
        
        changedFruit.count = changedFruit.count + changingFruit.count
        
        if changedFruit.count == changingFruit.count {
            isSuccess = true
        } else {
            isSuccess = false
        }
        
        return isSuccess
    }
    
}
