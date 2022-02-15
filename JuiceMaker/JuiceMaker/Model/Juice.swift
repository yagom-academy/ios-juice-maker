//
//  Juice.swift
//  JuiceMaker
//
//  Created by Oh Donggeon on 2022/02/15.
//

import Foundation

enum Juice: Stuff {
    
    case strawberry, banana, kiwi, pineapple, strawberryBanana, mango, mangoKiwi
    
    var ingredients: [FruitCounter] {
        var ingredients: [FruitCounter] = []
        switch self {
        case .strawberry:
            ingredients.append(FruitCounter(fruit: .strawberry, count: 16))
        case .banana:
            ingredients.append(FruitCounter(fruit: .banana, count: 2))
        case .kiwi:
            ingredients.append(FruitCounter(fruit: .kiwi, count: 3))
        case .pineapple:
            ingredients.append(FruitCounter(fruit: .pineapple, count: 2))
        case .strawberryBanana:
            ingredients.append(FruitCounter(fruit: .strawberry, count: 10))
            ingredients.append(FruitCounter(fruit: .banana, count: 1))
        case .mango:
            ingredients.append(FruitCounter(fruit: .mango, count: 3))
        case .mangoKiwi:
            ingredients.append(FruitCounter(fruit: .mango, count: 2))
            ingredients.append(FruitCounter(fruit: .kiwi, count: 1))
        }
        return ingredients
    }
    
    var name: String {
        return String(describing: self)
    }
    
}
