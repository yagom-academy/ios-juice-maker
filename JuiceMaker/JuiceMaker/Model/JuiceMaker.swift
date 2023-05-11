//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

struct JuiceMaker {
    let fruitStore = FruitStore()
    
    func make(juice menu: JuiceMenu) {
        do {
            let availableFruitAndAmountList = try validIngredients(by: menu.recipe)
            
            try availableFruitAndAmountList.forEach { (fruit, amount) in
                try fruitStore.useStock(of: fruit, amount: amount)
            }
        } catch {
            switch error {
            case JuiceError.nonexistentFruit:
                print("FruitStore에 해당 Fruit이 없습니다.")
            case JuiceError.shortageFruitStock:
                print("Fruit의 수량이 부족합니다.")
            default:
                print("알 수 없는 에러")
            }
        }
    }
    
    private func validIngredients(by recipe: [Ingredient]) throws -> [(Fruit, Int)] {
        let availableFruitAndAmountList = try recipe.map { ingredient in
            guard let fruit = fruitStore.fruits.first(where: { $0.key == ingredient.fruit }) else {
                throw JuiceError.nonexistentFruit
            }
            
            guard fruit.value - ingredient.amount >= 0 else {
                throw JuiceError.shortageFruitStock
            }
            
            let availableFruitAndAmount = (fruit.key, ingredient.amount)
            
            return availableFruitAndAmount
        }
        
        return availableFruitAndAmountList
    }
}
