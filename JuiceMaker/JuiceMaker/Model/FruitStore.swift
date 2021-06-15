//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

// 과일 타입
class FruitStore {
    static let shared = FruitStore()

    private var fruitStocks: Dictionary<Fruit, Int>
    private let emptyQuantity = 0
    
    private init() {
        fruitStocks = [.strawberry:10, .banana:10, .pineapple:10, .kiwi:10, .mango:10]
    }
    
    internal func currentStock(_ fruit: Fruit) -> Int {
        guard let stock = fruitStocks[fruit] else {
            return emptyQuantity
        }
        return stock
    }
    internal func changeStock(_ fruit: Fruit, _ changingQuantity: Int) {
        guard let stock = fruitStocks[fruit] else {
            return
        }
        fruitStocks.updateValue(stock - changingQuantity, forKey: fruit)
        
        NotificationCenter.default.post(
                name: NSNotification.Name(rawValue: "updateUILabels"), object: nil, userInfo: ["과일종류": fruit])
    }
//    func increaseByOne(_ fruit: Fruit) {
//        guard let stock = fruitStocks[fruit] else {
//            return
//        }
//        fruitStocks.updateValue(stock + 1, forKey: fruit)
//        // notification updateUI()
//    }
//
//    func decreaseByOne(_ fruit: Fruit)  {
//        guard let stock = fruitStocks[fruit] else {
//            return
//        }
//        fruitStocks.updateValue(stock - 1, forKey: fruit)
//        // notification updateUI()
//    }
//
//    func postChangingByOne() {
//        NotificationCenter.default.post(
//                    name: NSNotification.Name(rawValue: "updateUILabels"), object: nil)
//    }
}
