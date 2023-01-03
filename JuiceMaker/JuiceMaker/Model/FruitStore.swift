//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    
    var stockList: [Fruits : Int] = [ : ]
    
    init() {
        Fruits.allCases.forEach { stockList[$0] = 10 }
    }
    
    func addStock(fruit: Fruits, amount: Int) {
        guard let fruitStock = stockList[fruit] else {
            return
        }
        stockList[fruit] = fruitStock + amount
    }
    
    func subtractionStock(fruit: Fruits, amount: Int) {
        guard let fruitStock = stockList[fruit], fruitStock >= amount else {
            return
        }
        stockList[fruit] = fruitStock - amount
    }
    
    func printStock(fruit: Fruits) {
        guard let fruitStock = stockList[fruit] else {
            return
        }
        print("\(fruit)의 재고는 \(fruitStock)개 입니다.")
    }
}
