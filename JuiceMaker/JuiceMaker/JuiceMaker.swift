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
            return [.kiwi:3]
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
    case outOfStock
    case notFoundFruit
}

struct Stock {
    var fruits: FruitCount
    
    init(initialCount: UInt) {
        fruits = [.strawberry: initialCount, .banana: initialCount, .kiwi: initialCount, .pineapple: initialCount, .mango: initialCount]
    }
}

class JuiceMaker {
    private(set) var stock: Stock = Stock(initialCount: 10)
    
    func makeJuice(using juice: Juice) {
        for (ingredient, amount) in juice.recipe {
            do {
                try subtractStock(of: ingredient, count: amount)
            } catch {
                print("재고가 부족합니다")
            }
        }
    }
    
    func addStock(of fruit: Fruit) {
        if let storedFruit = stock.fruits[fruit] {
            stock.fruits[fruit] = storedFruit + 1
        }
    }
    
    func subtractStock(of fruit: Fruit, count: UInt) throws {
        guard let storedFruit = stock.fruits[fruit] else {
            throw JuiceMakerError.notFoundFruit
        }
        
        if storedFruit < count {
            throw JuiceMakerError.outOfStock
        }
        stock.fruits[fruit] = storedFruit - count
    }
}
