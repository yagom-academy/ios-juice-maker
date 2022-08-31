//
//  Fruits.swift
//  Created by Wonbi, woong
//

struct Fruits {
    enum FruitName {
        case strawberry
        case banana
        case pineapple
        case kiwi
        case mango
    }
    
    var name: FruitName
    var count: Int
    
    init(name: FruitName, count: Int) {
        self.name = name
        self.count = count
    }
}
