//
//  JuiceMaker - JuiceMaker.swift
//  Created by hisop, morgan on 2023/09/13.
//  Copyright © yagom academy. All rights reserved.
// 

struct JuiceMaker {
    var fruitStore = FruitStore(stock: 10)
    var recipes: [Menu: [Fruit: Int]] = [:]
    
    mutating func takeOrder(order: Menu) throws {
        guard let recipe = recipes[order] else {
            throw OrderFail.noMenu
        }
        
        guard fruitStore.checkIngredientStock(recipe: recipe) else {
            throw OrderFail.lackIngredient
        }
        
        grindJuice(recipe: recipe)
    }
    
    mutating func grindJuice(recipe: [Fruit: Int]) {
        for (fruit, quantity) in recipe {
            fruitStore.reduceStock(fruit: fruit, quantity: quantity)
        }
        
        print("\(recipe.keys)가 제작되었습니다.")
    }
    
    init() {
        recipes[.strawberryJuice] = [.strawberry: 16]
        recipes[.bananaJuice] = [.banana: 2]
        recipes[.kiwiJuice] = [.kiwi: 3]
        recipes[.pineappleJuice] = [.pineapple: 2]
        recipes[.mangoJuice] = [.mango: 3]
        recipes[.strawberryBananaJuice] = [.strawberry: 10, .banana: 1]
        recipes[.mangoKiwiJuice] = [.mango: 2, .kiwi: 1]
    }
}
