//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

typealias FruitCount = [Fruit: FruitInformation]

struct FruitInformation {
    var count: UInt
}

enum Fruit {
    case strawberry, banana, pineapple, kiwi, mango
}

enum Juice: String {
    case strawberry = "딸기"
    case banana = "바나나"
    case kiwi = "키위"
    case pineapple = "파인애플"
    case strawberryBanana = "딸바"
    case mango = "망고"
    case mangokiwi = "망키"
    
    var recipe: FruitCount {
        switch self {
        case .strawberry:
            return [.strawberry: FruitInformation(count: 16)]
        case .banana:
            return [.banana: FruitInformation(count: 2)]
        case .kiwi:
            return [.kiwi: FruitInformation(count: 3)]
        case .pineapple:
            return [.pineapple: FruitInformation(count: 2)]
        case .strawberryBanana:
            return [.strawberry: FruitInformation(count: 10), .banana: FruitInformation(count: 1)]
        case .mango:
            return [.mango: FruitInformation(count: 3)]
        case .mangokiwi:
            return [.mango: FruitInformation(count: 2), .kiwi: FruitInformation(count: 1)]
        }
    }
}

enum JuiceMakerError: Error {
    case outOfStock, notFoundFruit
}

struct FruitStock {
    private var remainedFruit: FruitCount
    
    init(initialCount: UInt) {
        remainedFruit = [.strawberry: FruitInformation(count: initialCount), .banana: FruitInformation(count: initialCount), .kiwi: FruitInformation(count: initialCount), .pineapple: FruitInformation(count: initialCount), .mango: FruitInformation(count: initialCount)]
    }
    
    mutating func addStock(of fruit: Fruit, count: UInt) {
        if let storedFruit = remainedFruit[fruit] {
            remainedFruit[fruit]?.count = storedFruit.count + count
        }
    }
    
    mutating func subtractStock(of fruit: Fruit, count: UInt) {
        if let storedFruit = remainedFruit[fruit] {
            remainedFruit[fruit]?.count = storedFruit.count - count
        }
    }
    
    func readCount(of fruit: Fruit) -> UInt {
        if let storedFruit = remainedFruit[fruit] {
            return storedFruit.count
        } else {
            return 0
        }
    }
}

class JuiceMaker {
    private var stock: FruitStock = FruitStock(initialCount: 10)
    static let shared = JuiceMaker()
    
    private init() { }
    
    func makeJuice(using juice: Juice) throws {
        for (ingredient, information) in juice.recipe {
            guard stock.readCount(of: ingredient) >=  information.count else {
                throw JuiceMakerError.outOfStock
            }
            
            stock.subtractStock(of: ingredient, count: information.count)
        }
    }
    
    func readStock(of fruit: Fruit) -> UInt {
        return stock.readCount(of: fruit)
    }
}
