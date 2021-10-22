//
//  JuiceMaker - FruitStore.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class FruitStore {
    enum Fruit: String, CaseIterable {
        case strawberry, banana, pineapple, kiwi, mango
        
        var stringValue: String {
            self.rawValue
        }
    }
    
    private var stockOfFruit: [Fruit: Int] = [:]
    
    init() {
        for fruit in Fruit.allCases {
            stockOfFruit[fruit] = 10
        }
    }
    
    private func checkStock(of fruit: Fruit, count: Int) throws {
        guard count >= 0 else {
            throw JuiceMakerError.invalidNumber
        }
        guard let fruitAmount = stockOfFruit[fruit],
              fruitAmount >= count else {
            throw JuiceMakerError.outOfStock(fruit.stringValue)
        }
    }

    func addStock(of fruit: Fruit, amount: Int) {
        if let stock = stockOfFruit[fruit] {
            stockOfFruit[fruit] = stock + amount
        }
    }
    
    func subtractStock(of fruit: Fruit, amount: Int) {
        do {
            try checkStock(of: fruit, count: amount)
            if let stock = stockOfFruit[fruit] {
                stockOfFruit[fruit] = stock - amount
            }
        } catch let JuiceMakerError.outOfStock(fruit) {
            print(JuiceMakerError.outOfStock(fruit).description)
        } catch JuiceMakerError.invalidNumber {
            print(JuiceMakerError.invalidNumber.description)
        } catch {
            print(error)
        }
    }
    
    func consumeFruits(firstFruit: Fruit, firstFruitAmount: Int, secondFruit: Fruit? = nil, secondFruitAmount: Int? = nil) {
        subtractStock(of: firstFruit, amount: firstFruitAmount)
        if let secondFruit = secondFruit,
           let secondFruitAmount = secondFruitAmount {
            subtractStock(of: secondFruit, amount: secondFruitAmount)
        }
    }
}
