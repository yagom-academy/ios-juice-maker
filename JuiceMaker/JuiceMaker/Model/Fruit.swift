//
//  JuiceMaker - Fruits.swift
//  Created by Wonbi, woong
//

enum Fruit: Int, CaseIterable {
    case strawberry = 0
    case banana
    case pineapple
    case kiwi
    case mango
    
    var index: Int {
        self.rawValue
    }
}
