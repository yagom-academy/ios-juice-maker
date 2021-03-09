//
//  FruitInStock.swift
//  JuiceMaker
//
//  Created by 강경 on 2021/03/08.
//

import Foundation

enum Fruit: String, CaseIterable {
    case strawberry = "Strawberry"
    case banana = "Banana"
    case pineapple = "Pineapple"
    case kiwi = "Kiwi"
    case mango = "Mango"
}

class StockOfFruit {
    private var stock = [Fruit:Int]()
    
    init() {
        for fruit in Fruit.allCases {
            self.stock[fruit] = 0
        }
    }

    func total(type: Fruit) -> Int? {
        return stock[type]
    }
    
    func add(type: Fruit) {
        stock[type]! += 1
    }
    
    func subtract(type: Fruit) {
        stock[type]! -= 1
    }
}
