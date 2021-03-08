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
}

class JuiceMaker {
    private var fruitStocks = [Int](repeating: 10, count: Fruit.allCases.count)
    
    func checkStock(fruit: Fruit) -> Int {
        return fruitStocks[fruit.index]
    }
    func checkStockAvailable(fruit: Fruit, stock: Int) -> Bool {
        if (checkStock(fruit: fruit) < stock) {
            return false
        }
        return true
    }
    func consumeFriut(fruit: Fruit, stock: Int) {
        fruitStocks[fruit.index] -= stock
    }
    func makeFruitJuice(juice: FruitJuice) {
        switch juice {
        case .strawberry:
            consumeFriut(fruit: .strawberry, stock: 16)
        case .banana:
            consumeFriut(fruit: .banana, stock: 2)
        case .kiwi:
            consumeFriut(fruit: .kiwi, stock: 3)
        case .pineapple:
            consumeFriut(fruit: .pineapple, stock: 2)
        case .strawberryBanana:
            consumeFriut(fruit: .strawberry, stock: 10)
            consumeFriut(fruit: .banana, stock: 1)
        case .mango:
            consumeFriut(fruit: .mango, stock: 3)
        case .mangoKiwi:
            consumeFriut(fruit: .mango, stock: 2)
            consumeFriut(fruit: .kiwi, stock: 1)
        }
    }
    func addStock(fruit: Fruit) {
        fruitStocks[fruit.index] += 1
    }
}

