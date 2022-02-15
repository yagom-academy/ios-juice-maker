//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Fruit: CaseIterable {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
}

protocol FruitStoreType {
    func count(of fruit: Fruit) -> Int
    func plusAmount(of fruit: Fruit)
    func minusAmount(of fruit: Fruit)
}

/// 과일 저장소 타입
final class FruitStore: FruitStoreType {
    private var fruitDictionary: [Fruit: Int] = [.strawberry: 10,
                                                 .banana: 10,
                                                 .pineapple: 10,
                                                 .kiwi: 10,
                                                 .mango: 10 ]

    func count(of fruit: Fruit) -> Int {
        return fruitDictionary[fruit] ?? 0
    }
    
    func plusAmount(of fruit: Fruit) {
        fruitDictionary[fruit] = fruitDictionary[fruit]! + 1
    }
    
    func minusAmount(of fruit: Fruit){
        fruitDictionary[fruit] = fruitDictionary[fruit]! - 1
    }
    
}
