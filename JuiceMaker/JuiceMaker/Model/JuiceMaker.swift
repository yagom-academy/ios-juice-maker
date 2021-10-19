//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    private let fruitStore: FruitStore
    
    init(fruitStore: FruitStore) {
        self.fruitStore = fruitStore
    }
    
    func make(juice: JuiceRecipe) throws -> JuiceRecipe {
        let unavailableFruits = getUnavailableFruit(juice: juice)
        
        guard unavailableFruits.count == 0 else {
            throw FruitStoreError.insufficientFruits(unavailabeFruits: unavailableFruits)
        }
        
        for (fruit, amount) in juice.ingredients {
            fruitStore.changeInventory(fruit, by: amount)
        }
        return juice
    }
  
    func getUnavailableFruit(juice: JuiceRecipe) -> [Fruit:Int] {
        let unavailableFruits = juice.ingredients.filter( {(fruit: Fruit, amount: Int) -> Bool in
            return fruitStore.isAvailable(fruit: fruit, amount: amount) == false
        })
        return unavailableFruits
    }
}

struct JuiceRecipe {
    var ingredients: [Fruit : Int] = [:]

    init(ingredientList: [(Fruit, Int)]) {
        for (fruit, amount) in ingredientList {
            ingredients[fruit] = amount
        }
    }
}

enum JuiceMenu: String {
    case strawberryJuice = "딸기쥬스"
    case banannaJuice = "바나나쥬스"
    case kiwiJuice = "키위쥬스"
    case pineappleJuice = "파인애플쥬스"
    case strawberryBanannaJuice = "딸바쥬스"
    case mangoJuice = "망고쥬스"
    case mangoKiwiJuice = "망고키위쥬스"
    
    var recipe: JuiceRecipe {
        switch self {
        case .strawberryJuice:
            return JuiceRecipe(ingredientList: [(Fruit.strawberry, 16)])
        case .banannaJuice:
            return JuiceRecipe(ingredientList: [(Fruit.bananna, 2)])
        case .kiwiJuice:
            return JuiceRecipe(ingredientList: [(Fruit.kiwi, 3)])
        case .pineappleJuice:
            return JuiceRecipe(ingredientList: [(Fruit.pineapple, 2)])
        case .strawberryBanannaJuice:
            return JuiceRecipe(ingredientList: [(Fruit.strawberry, 10), (Fruit.bananna, 1)])
        case .mangoJuice:
            return JuiceRecipe(ingredientList: [(Fruit.mango, 3)])
        case .mangoKiwiJuice:
            return JuiceRecipe(ingredientList: [(Fruit.mango, 2), (Fruit.kiwi, 1)])
        }
    }
}


