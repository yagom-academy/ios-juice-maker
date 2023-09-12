//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

struct JuiceMaker {
    var fruitStore = FruitStore(ingredientQuantity: 10)
    var recipe: [Menu: [Fruit: Int]] = [:]
    
    func takeOrder(order: Menu) {
        guard let unwrapRecipe = recipe[order] else {
            return
        }
        
        guard fruitStore.checkIngredient(recipe: unwrapRecipe) else {
            return
        }
        
        grindJuice()
    }
    
    func grindJuice() {
        
    }
    
    init() {
        recipe[.strawberryJuice] = [.strawberry: 16]
        recipe[.bananaJuice] = [.banana: 2]
        recipe[.kiwiJuice] = [.kiwi: 3]
        recipe[.pineappleJuice] = [.pineapple: 2]
        recipe[.mangoJuice] = [.mango: 3]
        recipe[.strawberryBananaJuice] = [.strawberry: 10, .banana: 1]
        recipe[.mangoKiwiJuice] = [.mango: 2, .kiwi: 1]
    }
}
