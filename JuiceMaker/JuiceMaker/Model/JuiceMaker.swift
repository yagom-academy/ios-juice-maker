//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

struct JuiceMaker {
    let fruitStore = FruitStore()
    
    func make(juice menu: JuiceMenu) -> Bool {
        do {
            let availableIngredients = try validIngredients(by: menu.recipe)
            
            try availableIngredients.forEach {
                try fruitStore.useStock(of: $0.fruit, amount: $0.amount)
            }
            
            return true
        } catch {
            switch error {
            case JuiceError.nonexistentFruit:
                print("FruitStore에 해당 Fruit이 없습니다.")
                return false
            case JuiceError.shortageFruitStock:
                print("Fruit의 수량이 부족합니다.")
                return false
            default:
                print("알 수 없는 에러")
                return false
            }
        }
    }
    
    private func validIngredients(by recipe: [Ingredient]) throws -> [Ingredient] {
        let availableIngredients = try recipe.map { ingredient in
            let fruitStock = try fruitStore.receiveStock(of: ingredient.fruit)
            
            guard fruitStock - ingredient.amount >= 0 else {
                throw JuiceError.shortageFruitStock
            }
            
            return ingredient
        }
        
        return availableIngredients
    }
}
