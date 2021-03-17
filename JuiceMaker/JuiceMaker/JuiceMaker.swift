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
    
    private func checkFruitStock(juice: ObjectIdentifier) -> Bool {
        if let juiceRequirements = recipes[juice] {
            for juiceRequirement in juiceRequirements {
                if let stockAvailable = fruitsStorage.fruitsStock[juiceRequirement.stock] {
                    if juiceRequirement.requiredAmount > stockAvailable {
                        return false
                    }
                }
            }
        }
        return true
    }
    
    func makeJuice(juice: ObjectIdentifier) {
        if checkFruitStock(juice: juice) {
            if let juiceAvailable = recipes[juice]{
                for index in juiceAvailable {
                    fruitsStorage.reduceFruit(fruit: index.stock, amount: index.requiredAmount)
                    print(fruitsStorage.fruitsStock)
                }
            }
            return
        }
    }
}
