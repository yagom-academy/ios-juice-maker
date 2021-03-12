//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

class Fruit {
    private(set) var name: String
    private(set) var amount: Int
    
    init(name: String, amount: Int) {
        self.name = name
        self.amount = amount
    }
    
    func addFruit() {
        self.amount += 1
    }
    
    func reducefruit(amount: Int) {
        self.amount -= amount
    }
}

var strawberry = Fruit(name: "딸기", amount: 10)
var banana = Fruit(name: "바나나", amount: 10)
var pineapple = Fruit(name: "파일애플", amount: 10)
var kiwi = Fruit(name: "키위", amount: 10)
var mango = Fruit(name: "망고", amount: 10)

enum FruitsJuice {
    case strawberryJuice, bananaJuice, pineappleJuice, kiwiJuice, mangoJuice, strawberryBananaJuice, mangoKiwiJuice
    
    func jucieRecipe() -> JuiceIngredients {
        switch self {
        case .strawberryJuice:
            return JuiceIngredients(ingredients: [(strawberry,16)])
        case .bananaJuice:
            return JuiceIngredients(ingredients: [(banana,2)])
        case .pineappleJuice:
            return JuiceIngredients(ingredients: [(pineapple,2)])
        case .kiwiJuice:
            return JuiceIngredients(ingredients: [(kiwi,3)])
        case .mangoJuice:
            return JuiceIngredients(ingredients: [(mango,3)])
        case .strawberryBananaJuice:
            return JuiceIngredients(ingredients: [(strawberry,10), (banana,1)])
        case .mangoKiwiJuice:
            return JuiceIngredients(ingredients: [(mango,2), (kiwi,2)])
        }
    }
}

typealias ingredient = (fruit: Fruit, amount: Int)

class JuiceIngredients {
    private(set) var ingredients: [ingredient]
    
    init(ingredients: [ingredient]) {
        self.ingredients = ingredients
    }
}

let successMessage = "쥬스가 완성되었습니다."
let failureMessage = "재고가 부족합니다."

class JuiceMaker {
    
    private func checkFruitStock(of juice: FruitsJuice) -> Bool {
        for ingredient in juice.jucieRecipe().ingredients {
            if ingredient.amount < ingredient.fruit.amount {
                return true
            }
        }
        return false
    }
    
    func informJuiceOrderResult(name: FruitsJuice) -> String {
        if checkFruitStock(of: name) {
            for ingredient in name.jucieRecipe().ingredients {
                ingredient.fruit.reducefruit(amount: ingredient.amount)
            }
            return successMessage
        } else {
            return failureMessage
        }
    }
}
