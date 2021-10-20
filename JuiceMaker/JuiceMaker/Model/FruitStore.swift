//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum JuiceMakerError: Error, CustomStringConvertible {
    case outOfStock
    case invalidNumber
    
    var description: String {
        switch self {
        case .outOfStock:
            return "재고가 부족합니다"
        case .invalidNumber:
            return "유효하지 않은 숫자입니다"
        }
    }
}

class FruitStore {
    enum Fruit: CaseIterable {
        case strawberry, banana, pineapple, kiwi, mango
    }
    
    var stockOfFruit: [Fruit: Int] = [:]
    
    init() {
        for fruit in Fruit.allCases {
            stockOfFruit[fruit] = 10
        }
    }
    
    func checkStock(name: Fruit, count: Int) throws {
        guard count >= 0 else { throw JuiceMakerError.invalidNumber }
        guard let fruitAmount = stockOfFruit[name],
              fruitAmount >= count else { throw JuiceMakerError.outOfStock }
    }
    
    func addFruit(name: Fruit, amount: Int) {
        if let inventory = stockOfFruit[name] {
            stockOfFruit[name] = inventory + amount
        }
    }
    
    func consumeFruit(name: Fruit, amount: Int) {
        do {
            try checkStock(name: name, count: amount)
            if let inventory = stockOfFruit[name] {
                stockOfFruit[name] = inventory - amount
            }
        } catch JuiceMakerError.outOfStock {
            print(JuiceMakerError.outOfStock.description)
        } catch JuiceMakerError.invalidNumber {
            print(JuiceMakerError.invalidNumber.description)
        } catch {
            print(error)
        }
    }
    
    func consumeMixed(first: Fruit, firstAmount: Int, second: Fruit, secondAmount: Int) {
        do {
            try checkStock(name: first, count: firstAmount)
            try checkStock(name: second, count: secondAmount)
            if let firstInventory = stockOfFruit[first], let secondInventory = stockOfFruit[second] {
                stockOfFruit[first] = firstInventory - firstAmount
                stockOfFruit[second] = secondInventory - secondAmount
            }
        } catch JuiceMakerError.outOfStock {
            print(JuiceMakerError.outOfStock.description)
        } catch JuiceMakerError.invalidNumber {
            print(JuiceMakerError.invalidNumber.description)
        } catch {
            print(error)
        }
    }
}
