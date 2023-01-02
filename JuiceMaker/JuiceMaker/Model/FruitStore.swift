//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    var strawberry: Int = 10
    var banana: Int = 10
    var pineapple: Int = 10
    var kiwi: Int = 10
    var mango: Int = 10
    
    static let shared = FruitStore()
    private init() {}
    
    func useFruits(fruits: Fruit, count: Int) {
        switch fruits {
        case .strawberry: strawberry -= count
        case .banana: banana -= count
        case .pineapple: pineapple -= count
        case .kiwi: kiwi -= count
        case .mango: mango -= count
        default: return
        }
    }
    
    func buyFruits(fruits: Fruit, count: Int) {
        switch fruits {
        case .strawberry: strawberry += count
        case .banana: banana += count
        case .pineapple: pineapple += count
        case .kiwi: kiwi += count
        case .mango: mango += count
        default: return
        }
    }
}
