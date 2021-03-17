//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

typealias juiceRecipe = [ObjectIdentifier : [Recipe]]

class JuiceMaker {
    private let recipes: juiceRecipe = [ObjectIdentifier(StrawberryJuice.self) : [(ObjectIdentifier(Strawberry.self), 16)],
                             ObjectIdentifier(BananaJuice.self) : [(ObjectIdentifier(Banana.self), 2)],
                             ObjectIdentifier(KiwiJuice.self) : [(ObjectIdentifier(Kiwi.self), 3)],
                             ObjectIdentifier(PineappleJuice.self) : [(ObjectIdentifier(Pineapple.self), 2)],
                             ObjectIdentifier(MangoJuice.self) : [(ObjectIdentifier(Mango.self), 3)],
                             ObjectIdentifier(StrawberryBananaJuice.self) :  [(ObjectIdentifier(Strawberry.self), 10),(ObjectIdentifier(Banana.self), 1)],
                             ObjectIdentifier(MangoKiwiJuice.self) : [(ObjectIdentifier(Mango.self), 2), (ObjectIdentifier(Kiwi.self), 1)]]
    
    var fruitsStorage = FruitsStorage.sharedInstance
    
    private func hasEnoughFruitStock(_ juice: juiceRecipe.Key) -> Bool {
        if let juiceIngredients = recipes[juice] {
            for juiceIngredient in juiceIngredients {
                if let remainedFruitStock = fruitsStorage.fruitsStock[juiceIngredient.stock] {
                    if juiceIngredient.requiredAmount > remainedFruitStock {
                        return false
                    }
                }
            }
        }
        return true
    }
    
    func makeJuice(_ juice: juiceRecipe.Key) {
        if hasEnoughFruitStock(juice) {
            if let juiceIngredient = recipes[juice]{
                for juiceIngredient in juiceIngredient {
                    fruitsStorage.reduceFruit(juiceIngredient.stock, amount: juiceIngredient.requiredAmount)
                    print(fruitsStorage.fruitsStock)
                }
            }
            return
        }
    }
}
