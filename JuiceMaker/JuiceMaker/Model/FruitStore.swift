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
//    let juiceMaker: JuiceMaker

    init() {
        for fruit in Fruit.allCases {
            stock[fruit] = initialStock
        }
    }
    
    func decreaseStock(from fruit: Fruit, by input: Int) throws {
        let userInput = input
        
        guard var currentStock = stock[fruit], currentStock > 0 else {
            throw ErrorCase.notEnoughStock
        }
        
        currentStock -= userInput
    }
}



