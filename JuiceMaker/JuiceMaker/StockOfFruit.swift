//
//  FruitInStock.swift
//  JuiceMaker
//
//  Created by 강경 on 2021/03/08.
//

import Foundation

enum Fruit: String {
    case strawberry = "Strawberry"
    case banana = "Banana"
    case pineapple = "Pineapple"
    case kiwi = "Kiwi"
    case mango = "Mango"
}

class StockOfFruit {
    private var stock = [Fruit:Int]()
    
    init() {

    }

    func total(type: Fruit) -> Int? {
        return stock[type]
    }
    
    func add(type: Fruit) {
    }
    
    func subtract(type: Fruit) {
    }
}
