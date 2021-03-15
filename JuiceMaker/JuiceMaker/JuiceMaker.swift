//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

typealias FruitCount = [Fruit: UInt]

enum Fruit {
    case strawberry, banana, pineapple, kiwi, mango
}

enum Juice {
    case strawberry, banana, kiwi, pineapple, strawberryBanana, mango, mangokiwi
    
    var recipe: FruitCount {
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
        case .mangokiwi:
            return [.mango: 2, .kiwi: 1]
        }
    }
}

enum JuiceMakerError: Error {
    case outOfStock, notFoundFruit
}

struct FruitStock {
    var remainedFruit: FruitCount
    
    init(initialCount: UInt) {
        remainedFruit = [.strawberry: initialCount, .banana: initialCount, .kiwi: initialCount, .pineapple: initialCount, .mango: initialCount]
    }
    
    mutating func addStock(of fruit: Fruit, count: UInt) {
        if let storedFruit = remainedFruit[fruit] {
            remainedFruit[fruit] = storedFruit + count
        }
    }
    
    mutating func subtractStock(of fruit: Fruit, count: UInt) {
        if let storedFruit = remainedFruit[fruit] {
            remainedFruit[fruit] = storedFruit - count
        }
    }
}

class JuiceMaker {
    private(set) var stock: FruitStock = FruitStock(initialCount: 10)
    
    func makeJuice(using juice: Juice) {
        for (ingredient, amount) in juice.recipe {
            stock.subtractStock(of: ingredient, count: amount)
        }
    }
    
}
