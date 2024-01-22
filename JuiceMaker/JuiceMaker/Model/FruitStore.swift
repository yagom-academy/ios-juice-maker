//
//  JuiceMaker - FruitStore.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum FruitCategory: Int {
    case strawberry
    case banana
    case kiwi
    case pineapple
    case mango
    
    var koreanName: String {
        switch self {
        case .strawberry:
            return "딸기"
        case .banana:
            return "바나나"
        case .kiwi:
            return "키위"
        case .pineapple:
            return "파인애플"
        case .mango:
            return "망고"
        }
    }
}

func initFruitStock() {
    let fruitStore = FruitStore.shared
    fruitStore.strawberry = 10
    fruitStore.banana = 10
    fruitStore.pineapple = 10
    fruitStore.kiwi = 10
    fruitStore.mango = 10
}

class FruitStore {
    static let shared = FruitStore()
    
    private init() {}
    
    var strawberry: Int?
    var banana: Int?
    var pineapple: Int?
    var kiwi: Int?
    var mango: Int?
}

func checkStock(recipe: [Combination]) -> FruitCategory? {
    let fruitStore = FruitStore.shared
    for fruitNameAndCount in recipe {
        switch fruitNameAndCount.fruitName {
        case .strawberry:
            if fruitStore.strawberry! < fruitNameAndCount.count {
                return .strawberry
            }
        case .banana:
            if fruitStore.banana! < fruitNameAndCount.count {
                return .banana
            }
        case .pineapple:
            if fruitStore.pineapple! < fruitNameAndCount.count {
                return .pineapple
            }
        case .kiwi:
            if fruitStore.kiwi! < fruitNameAndCount.count {
                return .kiwi
            }
        case .mango:
            if fruitStore.mango! < fruitNameAndCount.count {
                return .mango
            }
        }
    }
    return nil
}

func consumeStock(recipe: [Combination]) {
    let fruitStore = FruitStore.shared
    for fruitNameAndCount in recipe {
        switch fruitNameAndCount.fruitName {
        case .strawberry:
            fruitStore.strawberry! -= fruitNameAndCount.count
        case .banana:
            fruitStore.banana! -= fruitNameAndCount.count
        case .pineapple:
            fruitStore.pineapple! -= fruitNameAndCount.count
        case .kiwi:
            fruitStore.kiwi! -= fruitNameAndCount.count
        case .mango:
            fruitStore.mango! -= fruitNameAndCount.count
        }
    }
}
