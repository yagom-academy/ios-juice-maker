//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

class Fruit {
    private(set) var amount: Int
    
    init(amount: Int) {
        self.amount = amount
    }
    
    func addFruit(amount: Int) {
        self.amount += amount
    }
    
    func reducefruit(amount: Int) {
        self.amount -= amount
    }
}

enum FruitStock {
    static let strawberry = Fruit(amount: 10)
    static let banana = Fruit(amount: 10)
    static let pineapple = Fruit(amount: 10)
    static let kiwi = Fruit(amount: 10)
    static let mango = Fruit(amount: 10)
}

typealias ingredient = (fruit: Fruit, amount: Int)

class JuiceRecipe {
    private(set) var ingredients: [ingredient]
    
    init(ingredients: [ingredient]) {
        self.ingredients = ingredients
    }
}

enum JuiceMenu {
    static let strawberryJuice = JuiceRecipe(ingredients: [(FruitStock.strawberry,16)])
    static let bananaJuice = JuiceRecipe(ingredients: [(FruitStock.banana,2)])
    static let pineappleJuice = JuiceRecipe(ingredients: [(FruitStock.pineapple,2)])
    static let kiwiJuice = JuiceRecipe(ingredients: [(FruitStock.kiwi,3)])
    static let mangoJuice = JuiceRecipe(ingredients: [(FruitStock.mango,3)])
}

enum ResultMessages {
    static let successMessage = "쥬스가 완성되었습니다."
    static let failureMessage = "재고가 부족합니다."
}

class JuiceMaker {
    private func checkFruitStock(of juice: JuiceRecipe) -> Bool {
        for ingredient in juice.ingredients {
            if ingredient.amount < ingredient.fruit.amount {
                return true
            }
        }
        return false
    }
    
    func notifiedOrderedResult() {
        
    }
    
    func makeJuice(name: JuiceRecipe) -> String {
        if checkFruitStock(of: name) {
            for ingredient in name.ingredients {
                ingredient.fruit.reducefruit(amount: ingredient.amount)
            }
            return ResultMessages.successMessage
        } else {
            return ResultMessages.failureMessage
        }
    }
}
