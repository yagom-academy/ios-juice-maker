//
//  JuiceRecipe.swift
//  JuiceMaker
//
//  Created by 기원우 on 2021/03/17.
//

import Foundation

class JuiceRecipe {
    private let _recipe: [ObjectIdentifier: [ObjectIdentifier: Int]]
    
    init() {
        self._recipe = [
            ObjectIdentifier(StrawberryJuice.self):
                [ObjectIdentifier(Strawberry.self): 16],
            ObjectIdentifier(BananaJuice.self):
                [ObjectIdentifier(Banana.self): 2],
            ObjectIdentifier(PineappleJuice.self):
                [ObjectIdentifier(Pineapple.self): 2],
            ObjectIdentifier(KiwiJuice.self):
                [ObjectIdentifier(Kiwi.self): 3],
            ObjectIdentifier(MangoJuice.self):
                [ObjectIdentifier(Mango.self): 3],
            ObjectIdentifier(StrawberryBananaJuice.self):
                [ObjectIdentifier(Strawberry.self): 10, ObjectIdentifier(Banana.self): 1],
            ObjectIdentifier(MangoKiwiJuice.self):
                [ObjectIdentifier(Mango.self): 2, ObjectIdentifier(Kiwi.self): 1]
        ]
    }
    
    func canMake(targetRecipe: ObjectIdentifier, checkStocks: FruitStock) -> Bool {
        for (_fruit, _quantity) in _recipe[targetRecipe]! {
            if checkStocks.canMake(fruit: _fruit, quantity: _quantity) {
              return true
            }
        }
        
        return false
    }
    
    func useRecipe(targetRecipe: ObjectIdentifier, useStocks: FruitStock) {
        for (_fruit, _quantity) in _recipe[targetRecipe]! {
            useStocks.sub(fruit: _fruit, quantity: _quantity)
        }
    }

}
