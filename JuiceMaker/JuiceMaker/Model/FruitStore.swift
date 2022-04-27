//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
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
//        guard let currentNumber = stock[juiceRecipe[fruitName]] else {
//            throw ErrorCategory.cannotError }
//        if currentNumber < fruitAmount {
//            throw ErrorCategory.zeroError
//        }
//        stock[fruitName] = currentNumber - fruitAmount
    }
    
    func addFruitAmount(fruitName: FruitKind, amount: Int) {
        if let fruit = stock[fruitName] {
            stock[fruitName] = fruit + amount
        }
    }
}
