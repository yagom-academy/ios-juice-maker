//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class FruitStore {
    static let shared = FruitStore()
    var inventory: [Fruit: Int] = [:]
    
    private init() {
        let defaultQuantity = 10
        Fruit.allCases.forEach{ inventory[$0] = defaultQuantity }
    }
    
    func updateStock(by inputQuantity: [Fruit: Int], button: Button) {
        do {
            if button == .plus {
                try increaseStock(by: inputQuantity)
            } else {
                try decreaseStock(by: inputQuantity)
            }
        } catch let error as OrderError {
            print(error.description)
        } catch {
            print(error)
        }
    }
    
    func increaseStock(by inputQuantity: [Fruit: Int]) throws {
        for (fruit, quantity) in inputQuantity {
            guard let fruitStock = inventory[fruit] else {
                throw OrderError.unknownError
            }
            inventory[fruit] = fruitStock + quantity
        }
    }
    
    func decreaseStock(by inputQuantity: [Fruit: Int]) throws {
        for (fruit, quantity) in inputQuantity {
            guard let fruitStock = inventory[fruit] else {
                throw OrderError.unknownError
            }
            guard fruitStock >= quantity else {
                throw OrderError.outOfStock
            }
            inventory[fruit] = fruitStock - quantity
        }
    }
}
