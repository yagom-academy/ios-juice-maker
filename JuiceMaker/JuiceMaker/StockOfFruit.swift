//
//  StockOfFruit.swift
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

struct StockOfFruit {
    private var stock = [Fruit:Int]()
    
    init() {
        for fruit in Fruit.allCases {
            self.stock[fruit] = 1
        }
    }

    func total(type: Fruit) -> Int? {
        return stock[type]
    }
    
    mutating func use(type: Fruit, count: Int) {
        stock[type]! -= count
    }
    
    mutating func add(type: Fruit) {
        stock[type]! += 1
    }
    
    mutating func subtract(type: Fruit) {
        stock[type]! -= 1
    }
}
