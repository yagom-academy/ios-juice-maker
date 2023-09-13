//
//  JuiceMaker - JuiceMaker.swift
//  Created by hisop, morgan on 2023/09/13.
//  Copyright © yagom academy. All rights reserved.
// 

struct JuiceMaker {
    var fruitStore = FruitStore(stock: 10)
    var recipe: [Menu: [Fruit: Int]] = [:]
    
    mutating func takeOrder(order: Menu) throws {
        guard let needFruit = recipe[order] else {
            throw OrderFail.noMenu
        }
        
        guard fruitStore.checkIngredientStock(recipe: needFruit) else {
            throw OrderFail.lackIngredient
        }
        
        grindJuice(recipe: needFruit)
    }
    
    mutating func grindJuice(recipe: [Fruit: Int]) {
        for (fruit, quantity) in recipe {
            fruitStore.reduceStock(fruit: fruit, quantity: quantity)
        }
        
        print("\(recipe.keys)가 제작되었습니다.")
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
