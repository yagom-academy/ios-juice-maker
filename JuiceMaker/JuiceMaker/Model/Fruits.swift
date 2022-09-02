//
//  JuiceMaker - Fruits.swift
//  Created by Wonbi, woong
//

struct Fruits {
    enum FruitType: Int {
        case strawberry = 0
        case banana
        case pineapple
        case kiwi
        case mango
    }
    
    var name: FruitType
    var count: Int
    
    var fruitIndex: Int {
        self.name.rawValue
    }
    
    init(name: FruitType, count: Int) {
        self.name = name
        self.count = count
    }
}
