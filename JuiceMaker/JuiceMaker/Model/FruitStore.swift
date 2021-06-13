//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

enum Fruit {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
}

// 과일 타입
class FruitStore {
//    private var strawberry: Int = 10
//    private var banana: Int = 10
//    private var pineapple: Int = 10
//    private var kiwi: Int = 10
//    private var mango: Int = 10

    var fruitStocks: Dictionary<Fruit, Int>
    
    init() {
        fruitStocks = [.strawberry:10, .banana:10, .pineapple:10, .kiwi:10, .mango:10]
    }
    
    func currentStock(_ fruit: Fruit) throws -> Int {
        guard let stock = fruitStocks[fruit] else {
            throw JuiceMakerError.nilItem
        }
        return stock
    }
    
    func changeStock(_ fruit: Fruit, _ changingQuantity: Int) throws {
        guard let stock = fruitStocks[fruit] else {
            throw JuiceMakerError.nilItem
        }
        fruitStocks.updateValue(stock - changingQuantity, forKey: fruit)
        
        NotificationCenter.default.post(
                    name: NSNotification.Name(rawValue: "updateUI"),
                    object: nil)
    }
    
    func increaseByOne(_ fruit: Fruit) throws {
        guard let stock = fruitStocks[fruit] else {
            throw JuiceMakerError.nilItem
        }
        fruitStocks.updateValue(stock + 1, forKey: fruit)
        // notification updateUI()
    }
    
    func decreaseByOne(_ fruit: Fruit) throws {
        guard let stock = fruitStocks[fruit] else {
            throw JuiceMakerError.nilItem
        }
        fruitStocks.updateValue(stock - 1, forKey: fruit)
        // notification updateUI()
    }
    
    func postChangingByOne() {
        NotificationCenter.default.post(
                    name: NSNotification.Name(rawValue: "updateUI"),
                    object: nil)
    }
}
