//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    let fruitStore = FruitStore()
    
    func make(juice menu: JuiceMenu) {
        do {
            let availableFruitAndAmountList = try validIngredients(by: menu.recipe)
            
            availableFruitAndAmountList.forEach { (fruit, amount) in
                fruitStore.subtract(fruit: fruit, amount: amount)
            }
        } catch {
            switch error {
            case JuiceError.noFruitInFruitStore:
                print("FruitStore에 해당 Fruit이 없습니다.")
            case JuiceError.notEnoughFruitStock:
                print("Fruit의 수량이 부족합니다.")
            default:
                print("알 수 없는 에러")
            }
        }
    }
    
    func validIngredients(by recipe: [Ingredient]) throws -> [(Fruit, Int)] {
        let availableFruitAndAmountList = try recipe.map { ingredient in
            guard let fruit = fruitStore.fruits.first(where: { $0.key == ingredient.fruit }) else {
                throw JuiceError.noFruitInFruitStore
            }
            
            guard fruit.value - ingredient.amount >= 0 else {
                throw JuiceError.notEnoughFruitStock
            }
            
            let availableFruitAndAmount = (fruit.key, ingredient.amount)
            
            return availableFruitAndAmount
        }
        
        return availableFruitAndAmountList
    }
}
