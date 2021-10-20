//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum JuiceMakerError: Error {
    case outOfStock
    case invalidNumber
}

class FruitStore {
    enum Fruit: CaseIterable {
        case strawberry, banana, pineapple, kiwi, mango
    }
    
    var fruitInventory: [Fruit: Int] = [:]
    
    init() {
        for fruit in Fruit.allCases {
            fruitInventory[fruit] = 10
        }
    }
    
    func check(fruit: Fruit, count: Int) throws {
        guard count >= 0 else { throw JuiceMakerError.invalidNumber }
        guard let fruitAmount = fruitInventory[fruit],
              fruitAmount >= count else { throw JuiceMakerError.outOfStock }
    }
    
    func addFruitInventroy(fruit: Fruit, amount: Int) {
        guard let inventory = fruitInventory[fruit] else {
            return
        }
        fruitInventory[fruit] = inventory + amount
    }
    
    func useFruitInventroy(fruit: Fruit, amount: Int) {
        do {
            try check(fruit: fruit, count: amount)
            guard let inventory = fruitInventory[fruit] else {
                return
            }
            fruitInventory[fruit] = inventory - amount
        } catch JuiceMakerError.outOfStock {
            print("재고가 부족합니다")
        } catch JuiceMakerError.invalidNumber {
            print("유효하지 않은 숫자입니다")
        } catch {
            print(error)
        }
    }
}
