//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입

class FruitStore {
    enum Fruit {
        case strawberry
        case banana
        case pineapple
        case kiwi
        case mango
    }

    var species: Fruit
    var initialStock: Int

    init(stock: Int, species: Fruit) {
        self.initialStock = 10
        self.species = .strawberry
    }
}

let strawberry = FruitStore.init(stock: 10, species: .strawberry)
let banana = FruitStore.init(stock: 10, species: .banana)
let pineapple = FruitStore.init(stock: 10, species: .pineapple)
let kiwi = FruitStore.init(stock: 10, species: .kiwi)
let mango = FruitStore.init(stock: 10, species: .mango)

//class FruitStore {
//    enum Fruit: CaseIterable {
//        case strawberry
//        case banana
//        case pineapple
//        case kiwi
//        case mango
//    }
//
//    var initialStock = 10
//
//    var storage = [Int]()
//}
