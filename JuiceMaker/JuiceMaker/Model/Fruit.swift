//
//  JuiceMaker - Fruits.swift
//  Created by Wonbi, woong
//


enum Fruit: Int {
    case strawberry = 0
    case banana
    case pineapple
    case kiwi
    case mango
    
    var index: Int {
        self.rawValue
    }
}

struct Recipe {
    var name: Fruit
    var count: Int
    
    init(name: Fruit, count: Int) {
        self.name = name
        self.count = count
    }
}
