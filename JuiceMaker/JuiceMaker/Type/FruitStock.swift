//
//  FruitStock.swift
//  JuiceMaker
//
//  Created by 기원우 on 2021/03/17.
//

import Foundation

class FruitStock {
    private var _fruits: [ObjectIdentifier: Int] = [
        ObjectIdentifier(Strawberry.self) : 10,
        ObjectIdentifier(Banana.self) : 10,
        ObjectIdentifier(Pineapple.self) : 10,
        ObjectIdentifier(Kiwi.self) : 10,
        ObjectIdentifier(Mango.self) : 10
    ]
    func check(fruit: ObjectIdentifier) -> Int {
        return self._fruits[fruit]!
    }
    
    func add(fruit: ObjectIdentifier, quantity: Int) {
        self._fruits[fruit]! += quantity
    }
    
    func sub(fruit: ObjectIdentifier, quantity: Int) {
        self._fruits[fruit]! -= quantity
    }
    
    func canMake(fruit: ObjectIdentifier, quantity: Int) -> Bool {
        if self._fruits[fruit]! >= quantity {
            return true
        }
        
        return false
    }
}
