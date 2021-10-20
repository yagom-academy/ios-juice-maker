//
//  JuiceMaker - FruitStore.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

enum ErrorCase: Error {
    case notEnoughStock
    case noFruit
}

class FruitStore {
    enum Fruit: CaseIterable {
        case strawberry
        case banana
        case pineapple
        case kiwi
        case mango
    }
    
    let initialStock = 10
    var stock = [Fruit: Int]()

    init() {
        for fruit in Fruit.allCases {
            stock[fruit] = initialStock
        }
    }
    
    func decreaseStock(from fruit: Fruit, by input: Int) throws {
        guard let currentStock = stock[fruit], currentStock > input else {
            throw ErrorCase.notEnoughStock
        }
        
        stock[fruit] = currentStock - input
    }
    
    func increasStock(from fruit: Fruit, by input: Int) throws {
        guard let currentStock = stock[fruit] else {
            throw ErrorCase.noFruit
        }
        
        stock[fruit] = currentStock + input
    }
}



