//
//  JuiceMaker - FruitStore.swift
//  Created by BaekGom,Kay. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    private var stock: Dictionary<FruitKind, Int> =
    [FruitKind.strawberry: initCount.Fruit.amount,
     FruitKind.banana: initCount.Fruit.amount,
     FruitKind.kiwi: initCount.Fruit.amount,
     FruitKind.pineapple : initCount.Fruit.amount,
     FruitKind.mango: initCount.Fruit.amount]

    func changeFruitAmount(fruitName: FruitKind, amount: Int) {
        stock[fruitName] = amount
    }
    
    func subtractFruitAmount(juiceRecipe: Dictionary<FruitKind, Int>) throws {
        var correctCount = 0
        for (fruitName, fruitCount) in juiceRecipe {
            guard let currentNumber = stock[fruitName] else {
                throw ErrorCategory.cannotError }
            if currentNumber < fruitCount {
                throw ErrorCategory.zeroError
            }
            if currentNumber <= 0 {
                throw ErrorCategory.zeroError
            }
            correctCount += 1
        }
        if correctCount == juiceRecipe.count {
            confirmFruitAmount(juiceRecipe: juiceRecipe)
        }
    }
    
    func confirmFruitAmount(juiceRecipe: Dictionary<FruitKind, Int>) {
        for (fruitName, fruitCount) in juiceRecipe {
            if let currentNumber = stock[fruitName] {
                stock[fruitName] = currentNumber - fruitCount
            }
        }
    }
    
    func addFruitAmount(fruitName: FruitKind, amount: Int) {
        if let fruit = stock[fruitName] {
            stock[fruitName] = fruit + amount
        }
    }
    
    func returnStock() -> Dictionary<FruitKind, Int>{
        return stock
    }
}
