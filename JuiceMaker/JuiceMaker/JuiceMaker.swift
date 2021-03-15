//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Fruit: Int, CaseIterable {
    case strawberry, banana, pineapple, kiwi, mango
    
    var index: Int {
        return self.rawValue
    }
}

enum FruitJuice {
    case strawberry, banana, kiwi, pineapple, strawberryBanana, mango, mangoKiwi
    
    var recipe: [Fruit: Int] {
        switch self {
        case .strawberry:
            return [.strawberry: 16]
        case .banana:
            return [.banana: 2]
        case .kiwi:
            return [.kiwi: 3]
        case .pineapple:
            return [.pineapple: 2]
        case .strawberryBanana:
            return [.strawberry: 10, .banana: 1]
        case .mango:
            return [.mango: 3]
        case .mangoKiwi:
            return [.mango: 2, .kiwi: 1]
        }
    }
}

class JuiceMaker {
    private var fruitStocks = [Int](repeating: 10, count: Fruit.allCases.count)
    
    func checkStock(of fruit: Fruit) -> Int {
        return fruitStocks[fruit.index]
    }
    func checkStockAvailable(fruit: Fruit, stock: Int) -> Bool {
        if (checkStock(of: fruit) < stock) {
            return false
        }
        return true
    }
    func consumeFruit(fruit: Fruit, stock: Int) {
        fruitStocks[fruit.index] -= stock
    }
    func makeFruitJuice(_ juice: FruitJuice) {
        for (ingredient, amount) in juice.recipe {
            consumeFruit(fruit: ingredient, stock: amount)
        }
    }
    func addStock(fruit: Fruit) {
        fruitStocks[fruit.index] += 1
    }
}




