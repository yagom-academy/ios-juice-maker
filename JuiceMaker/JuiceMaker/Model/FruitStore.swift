//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class FruitStore {
    var fruitInventory: [Fruit: Int] = [:]
    
    init() {
        let defaultQuantity = 10
        Fruit.allCases.forEach{ fruitInventory[$0] = defaultQuantity }
    }
    
    func changeFruitStock(by inputFruitQuantity: [Fruit: Int], buttonType: ButtonType) {
        do {
            if buttonType == .add {
                try addFruitStock(by: inputFruitQuantity)
            } else {
                try reduceFruitStock(by: inputFruitQuantity)
            }
        } catch let error as OrderError {
            print(error.description)
        } catch {
            print(error)
        }
    }
    
    func addFruitStock(by inputFruitQuantity: [Fruit: Int]) throws {
        for (fruit, quantity) in inputFruitQuantity {
            guard let fruitStock = fruitInventory[fruit] else {
                throw OrderError.wrongFormat
            }
            fruitInventory[fruit] = fruitStock + quantity
        }
    }
    
    func reduceFruitStock(by inputFruitQuantity: [Fruit: Int]) throws {
        for (fruit, quantity) in inputFruitQuantity {
            guard let fruitStock = fruitInventory[fruit] else {
                throw OrderError.wrongFormat
            }
            guard fruitStock >= quantity else {
                throw OrderError.outOfStock
            }
            fruitInventory[fruit] = fruitStock - quantity
        }
    }
}
