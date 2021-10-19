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
    var count: Int
    
    init(fruitName: FruitName, count: Int) {
        self.name = fruitName
        self.count = count
    }
}
