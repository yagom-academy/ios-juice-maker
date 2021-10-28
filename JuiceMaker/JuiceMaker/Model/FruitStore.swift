//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation
import UIKit

enum Fruit: String, CaseIterable, CustomStringConvertible {
    var description: String {
        return "\(self.rawValue)"
    }
    
    case strawberry = "딸기"
    case banana = "바나나"
    case pineapple = "파인애플"
    case kiwi = "키위"
    case mango = "망고"
}

enum FruitStoreError: Error {
    case outOfStock(_ fruitNeeded: [Fruit: Int])
}

class FruitStore {
    static let shared = FruitStore()
    private static let initialFruitQuantity = 10
    
    let didChangeStock = Notification.Name("재고 수정 완료")
    private var stock: [Fruit: Int] {
        didSet {
            NotificationCenter.default.post(name: didChangeStock, object: nil)
        }
    }
    
    private init(quantity: Int = FruitStore.initialFruitQuantity) {
        self.stock = FruitStore.initializeStock(quantity: quantity)
    }
    
    private static func initializeStock(quantity: Int) -> [Fruit: Int] {
        var stock: [Fruit: Int] = [:]
        
        for key in Fruit.allCases {
            stock[key] = quantity
        }
        
        return stock
    }
    
    func showStock(of fruit: Fruit) -> String {
        guard let fruitQuantity = stock[fruit] else {
            return "0"
        }
        
        return String(fruitQuantity)
    }
    
    func updateStock(of recipe: [Fruit: Int]) throws {
        let calculatedStock = stock.merging(recipe) { $0 - $1 }
        
        try checkOutOfStock(calculatedStock)
        
        stock = calculatedStock
    }
    
    func add(fruit: Fruit, quantity: Int = 1) {
        if let fruitCount = stock[fruit] {
            stock.updateValue(fruitCount + quantity, forKey: fruit)
        }
    }
        
    private func checkOutOfStock(_ calculatedStock: [Fruit: Int]) throws {
        let neededFruits = calculatedStock.filter { $0.value < 0 }
        
        guard neededFruits.count == 0 else {
            throw FruitStoreError.outOfStock(neededFruits)
        }
    }
}
