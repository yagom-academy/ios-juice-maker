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
    var fruits: [FruitCategory: Int]
    
    init(fruits: [FruitCategory : Int]) {
        self.fruits = fruits
    }
    
    func isAvailable(menu: [JuiceMenu]) -> Bool {
        for ingredients in menu {
            return isAvailable(fruit: ingredients)
        }
        return true
    }
    
    func isAvailable(fruit: JuiceMenu) -> Bool {
        switch fruit {
        case .recipe(let fruitName, let number):
            guard let fruitNumber = fruits[fruitName] else {
                return false
            }
            
            if fruitNumber < number {
                print("\(fruitName.koreanName)의 재고가 부족합니다.")
                return false
            }
        }
        
        print("\(fruit) 제조에 성공했습니다.")
        return true
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
