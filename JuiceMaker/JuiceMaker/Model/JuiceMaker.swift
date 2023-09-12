//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

struct JuiceMaker {
    var fruitStore = FruitStore(ingredientQuantity: 10)
    var recipe: [Menu: [Fruit: Int]] = [:]
    
    mutating func takeOrder(order: Menu) {
        guard let unwrapRecipe = recipe[order] else {
            return
        }
        
        guard fruitStore.checkIngredient(recipe: unwrapRecipe) else {
            return
        }
        
        grindJuice(recipe: unwrapRecipe)
    }
    
    mutating func grindJuice(recipe: [Fruit: Int]) {
        for (fruit, quantity) in recipe {
            fruitStore.changeQuantity(fruit: fruit, quantity: quantity)
        }
        
        print("\(recipe.keys)쥬스가 제작되었습니다.")
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
