//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

class Fruit {
    private(set) var fruitName: String
    private(set) var fruitAmount: Int
    
    init(name: String,amount: Int) {
        self.fruitName = name
        self.fruitAmount = amount
    }
    
    func addfruit() {
        self.fruitAmount += 1
    }
    
    func reducefruit(amount: Int) {
        self.fruitAmount -= amount
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
//        var result =
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

typealias ingredient = (Fruit, Int)

class JuiceIngredients {
    var Ingredients: [ingredient]
    
    init(ingredients: [ingredient]) {
        self.Ingredients = ingredients
    }
}

class JuiceMaker {
    // 쥬스 제조
//    func checkFruitStock(something: FruitsJuice, other: Fruit) -> Bool {
//        if something.jucieRecipe().Ingredients < other.fruitAmount {
//
//        }
    }
    
    func produceFruitsJuice(juice: FruitsJuice) {
        switch juice {
        case .strawberryJuice:
            if true { // 재고가 충분한지 -> Bool
            }           // true를 반환하면 JuiceIngredients 개수만큼 감소(reduceFruit)
        case .bananaJuice:
            banana.reducefruit(amount: 2)
        case .pineappleJuice:
            pineapple.reducefruit(amount: 2)
        case .kiwiJuice:
            kiwi.reducefruit(amount: 3)
        case .mangoJuice:
            mango.reducefruit(amount: 3)
        case .mangoKiwiJuice:
            mango.reducefruit(amount: 2)
            kiwi.reducefruit(amount: 1)
        case .strawberryBananaJuice:
            strawberry.reducefruit(amount: 10)
            banana.reducefruit(amount: 1)
        }
        return result
    }

