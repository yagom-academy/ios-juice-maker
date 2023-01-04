//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    
    var fruitStocks: [Fruits : Int] = [ : ]
    let initialStock = 10
    
    init() {
        Fruits.allCases.forEach { fruitStocks[$0] = initialStock }
    }
    
    func addStock(fruit: Fruits, amount: Int) {
        guard let fruitStock = fruitStocks[fruit] else {
            return
        }
        fruitStocks[fruit] = fruitStock + amount
    }
    
    func subtractStock(fruit: Fruits, amount: Int) throws {
        guard let fruitStock = fruitStocks[fruit], fruitStock >= amount else {
            throw JuiceMakerError.outOfStock
        }
        fruitStocks[fruit] = fruitStock - amount
    }
    
    func printStock(fruit: Fruits) {
        guard let fruitStock = fruitStocks[fruit] else {
            return
        }
        print("\(fruit)의 재고는 \(fruitStock)개 입니다.")
    }
}
