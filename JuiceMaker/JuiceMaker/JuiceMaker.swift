//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

typealias juiceRecipe = [ObjectIdentifier : [Recipe]]
typealias juiceName = [ObjectIdentifier : String]

class JuiceMaker {

    let juicename : juiceName = [ObjectIdentifier(StrawberryJuice.self) : "딸기쥬스", ObjectIdentifier(BananaJuice.self) : "바나나쥬스",
                                         ObjectIdentifier(KiwiJuice.self) : "키위쥬스", ObjectIdentifier(PineappleJuice.self) : "파인애플쥬스",
                                         ObjectIdentifier(MangoJuice.self): "망고쥬스", ObjectIdentifier(StrawberryBananaJuice.self) : "딸바쥬스",
                                         ObjectIdentifier(MangoKiwiJuice.self) : "망키쥬스"]
    
    let recipes: juiceRecipe = [ObjectIdentifier(StrawberryJuice.self) : [(ObjectIdentifier(Strawberry.self), 6)],
                             ObjectIdentifier(BananaJuice.self) : [(ObjectIdentifier(Banana.self), 2)],
                             ObjectIdentifier(KiwiJuice.self) : [(ObjectIdentifier(Kiwi.self), 3)],
                             ObjectIdentifier(PineappleJuice.self) : [(ObjectIdentifier(Pineapple.self), 2)],
                             ObjectIdentifier(MangoJuice.self) : [(ObjectIdentifier(Mango.self), 3)],
                             ObjectIdentifier(StrawberryBananaJuice.self) :  [(ObjectIdentifier(Strawberry.self), 10),(ObjectIdentifier(Banana.self), 1)],
                             ObjectIdentifier(MangoKiwiJuice.self) : [(ObjectIdentifier(Mango.self), 2), (ObjectIdentifier(Kiwi.self), 1)]]
    
    var fruitsStorage = FruitsStorage.sharedInstance
    
    private func hasEnoughFruitStock(_ juice: juiceRecipe.Key) -> Bool {
        if let juiceIngredients = recipes[juice] {
            for ingredient in juiceIngredients {
                if let remainedFruitStock = fruitsStorage.fruitsStock[ingredient.stock], ingredient.requiredAmount > remainedFruitStock {
                    return false
                }
            }
        }
        return true
    }
    
    func makeJuice(_ juice: juiceRecipe.Key, completion: (Bool, ObjectIdentifier) -> Void) {
        if hasEnoughFruitStock(juice) {
            if let juiceIngredient = recipes[juice]{
                for juiceIngredient in juiceIngredient {
                    fruitsStorage.reduceFruit(juiceIngredient.stock, amount: juiceIngredient.requiredAmount)
                    completion(true, juice)
                }
            }
        }
        completion(false, juice)
    }
}
