//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    let fruitstore = FruitStore()

    enum Juice {
        case strawberry
        case banana
        case kiwi
        case pineapple
        case strawberrybanana
        case mango
        case mangokiwi

        var recipe : [FruitStore.Fruit:Int] {
            switch self {
            case .strawberry: return [.strawberry: 16]
            case .banana: return [.banana: 2]
            case .kiwi: return [.pineapple: 2]
            case .pineapple: return [.kiwi: 3]
            case .strawberrybanana: return [.strawberry: 10, .banana: 1]
            case .mango: return [.mango: 3]
            case .mangokiwi: return [.mango: 2,.kiwi: 1]
            }
        }
    }

    func makeJuice(juice: Juice) throws {
        for (fruit, amount) in juice.recipe {
            try fruitstore.useFruit(which: fruit, on: amount)
        }
    }
}

