//
//  Fruit.swift
//  JuiceMaker
//
//  Created by 김민성 on 2021/03/14.
//

import Foundation

class Fruit {
    private(set) var amount: Int
    
    init(amount: Int) {
        self.amount = amount
    }
    
    func addFruit(amount: Int) {
        self.amount += amount
    }
    
    func reducefruit(amount: Int) {
        self.amount -= amount
    }
}

class FruitStock {
    static let sharedInstance = FruitStock()
    
    let strawberry = Fruit(amount: 10)
    let banana = Fruit(amount: 10)
    let pineapple = Fruit(amount: 10)
    let kiwi = Fruit(amount: 10)
    let mango = Fruit(amount: 10)
    
    private init() {
        
    }
}
