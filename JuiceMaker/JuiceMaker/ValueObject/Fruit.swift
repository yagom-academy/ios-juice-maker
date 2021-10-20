//
//  Fruit.swift
//  JuiceMaker
//
//  Created by Eunsoo KIM on 2021/10/19.
//

import Foundation

class Fruit {
    enum FruitName {
        case strawberry
        case banana
        case kiwi
        case pineapple
        case mango
    }
    
    let name: FruitName
    var quantity: Int
    
    init(name: FruitName, quantity: Int) {
        self.name = name
        self.quantity = quantity
    }
}
