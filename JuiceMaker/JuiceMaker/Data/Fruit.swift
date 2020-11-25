//
//  Fruit.swift
//  JuiceMaker
//
//  Created by Wonhee on 2020/11/19.
//

import Foundation

enum FruitsType {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
    
    func getName() -> String {
        switch self {
        case .strawberry:
            return "🍓"
        case .banana:
            return "🍌"
        case .pineapple:
            return "🍍"
        case .kiwi:
            return "🥝"
        case .mango:
            return "🥭"
        }
    }
}

class Fruit {
    let fruitType: FruitsType
    private(set) var stock: Int
    
    init(fruitType: FruitsType) {
        self.fruitType = fruitType
        self.stock = 10
    }
    
    func setStock(_ stock: Int) {
        self.stock = stock
    }
    
    func useStock(_ use: Int) {
        self.stock = self.stock - use
    }
    
    func canMakeJuice(need: Int) -> Bool {
        return stock >= need
    }
}
