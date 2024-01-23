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

func checkSufficientStock(recipe: [Ingredient]) -> Bool {
    let fruitStore = FruitStore.shared
    
    for fruitNameAndCount in recipe {
        switch fruitNameAndCount.fruitName {
        case .strawberry:
            if fruitStore.strawberry ?? 0 < fruitNameAndCount.count {
                print("\(fruitNameAndCount.fruitName.koreanName)의 재고가 부족합니다!")
                return false
            }
        case .banana:
            if fruitStore.banana ?? 0 < fruitNameAndCount.count {
                print("\(fruitNameAndCount.fruitName.koreanName)의 재고가 부족합니다!")
                return false
            }
        case .pineapple:
            if fruitStore.pineapple ?? 0 < fruitNameAndCount.count {
                print("\(fruitNameAndCount.fruitName.koreanName)의 재고가 부족합니다!")
                return false
            }
        case .kiwi:
            if fruitStore.kiwi ?? 0 < fruitNameAndCount.count {
                print("\(fruitNameAndCount.fruitName.koreanName)의 재고가 부족합니다!")
                return false
            }
        case .mango:
            if fruitStore.mango ?? 0 < fruitNameAndCount.count {
                print("\(fruitNameAndCount.fruitName.koreanName)의 재고가 부족합니다!")
                return false
            }
        }
    }
    return true
}

func consumeStock(recipe: [Ingredient]) {
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
