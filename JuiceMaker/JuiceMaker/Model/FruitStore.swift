//
//  JuiceMaker - FruitStore.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

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
    var fruit: [FruitCategory: Int]
    
    init(fruit: [FruitCategory : Int]) {
        self.fruit = fruit
    }
    
    func checkSufficientStock(recipe: [JuiceMenu]) -> Bool {
        for fruitForRecipe in recipe {
            return checkFruitStock(fruitForRecipe: fruitForRecipe)
        }
        return true
    }
    
    func checkFruitStock(fruitForRecipe: JuiceMenu) -> Bool {
        switch fruitForRecipe {
        case .recipe(let fruitName, let number):
            guard let fruitNumber = fruit[fruitName] else {
                return false
            }
            
            if fruitNumber < number {
                print("\(fruitName.koreanName)의 재고가 부족합니다.")
                return false
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
            guard var fruitNumber = fruit[fruitName] else {
                return
            }
            fruitNumber -= number
            fruit[fruitName] = fruitNumber
        }
    }
}
