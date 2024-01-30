//
//  JuiceMaker - FruitStore.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

enum FruitStoreError: Error {
    case outOfStock
    case invalidFruitName
}

enum FruitCategory: Int {
    case strawberry
    case banana
    case kiwi
    case pineapple
    case mango
    
    var koreanName: String {
        switch self {
        case .strawberry:
            return "딸기"
        case .banana:
            return "바나나"
        case .kiwi:
            return "키위"
        case .pineapple:
            return "파인애플"
        case .mango:
            return "망고"
        }
    }
}

class FruitStore {
    var fruits: [FruitCategory: Int]
    
    init(fruits: [FruitCategory : Int]) {
        self.fruits = fruits
    }
    
    func isAvailable(menu: [JuiceMenu]) throws {
        for ingredients in menu {
            try isAvailable(fruit: ingredients)
        }
    }
    
    func isAvailable(fruit: JuiceMenu) throws {
        switch fruit {
        case .recipe(let fruitName, let number):
            if let fruitNumber = fruits[fruitName], fruitNumber >= number {
                print("\(fruitName.koreanName)(이)가 충분합니다.")
            } else {
                print("\(fruitName.koreanName)(이)가 부족합니다.")
                throw FruitStoreError.outOfStock
            }
        }
    }
    
    func consumeStock(recipe: [JuiceMenu]) {
        for fruitForRecipe in recipe {
            consumeFruitStock(fruitForRecipe: fruitForRecipe)
        }
    }
    
    func consumeFruitStock(fruitForRecipe: JuiceMenu) {
        switch fruitForRecipe {
        case .recipe(let fruitName, let number):
            guard var fruitNumber = fruits[fruitName] else {
                return
            }
            fruitNumber -= number
            fruits[fruitName] = fruitNumber
        }
    }
}
