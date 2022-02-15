//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    
    enum Fruit: Hashable, CaseIterable {
        case strawberry
        case banana
        case pineapple
        case kiwi
        case mango
    }
    
    // MARK: - Properties
    
    var store: [Fruit: Int] = [:]
    
    // MARK: - Lifecycle
    
    init(initialStock: Int) {
        Fruit.allCases.forEach {
            store[$0] = initialStock
        }
    }
}
