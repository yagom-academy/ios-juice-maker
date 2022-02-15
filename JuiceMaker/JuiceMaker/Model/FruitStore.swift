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
    func plusAmount(of fruit: Fruit) -> Int
    func minusAmount(of fruit: Fruit) -> Int
}

/// 과일 저장소 타입
final class FruitStore: FruitStoreType {
    private var strawberry: Int = 10
    private var banana: Int = 10
    private var pineapple: Int = 10
    private var kiwi: Int = 10
    private var mango: Int = 10

    func count(of fruit: Fruit) -> Int {
        switch fruit {
        case .strawberry:
            return strawberry
        case .banana:
            return banana
        case .pineapple:
            return pineapple
        case .kiwi:
            return kiwi
        case .mango:
            return mango
        }
    }
    
    func plusAmount(of fruit: Fruit) -> Int {
        let plusCount: Int = count(of: fruit) + 1
        return plusCount
    }
    
    func minusAmount(of fruit: Fruit) -> Int {
        let minusCount: Int = count(of: fruit) - 1
        return minusCount
    }
    
}
