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

class FruitStore {
    init() {}
    
    var strawberry: Int?
    var banana: Int?
    var pineapple: Int?
    var kiwi: Int?
    var mango: Int?
}

func checkSufficientStock(recipe: [Ingredient]) -> Bool {
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
    for fruitNameAndCount in recipe {
        switch fruitNameAndCount.fruitName {
        case .strawberry:
            guard var strawberryCount = fruitStore.strawberry else {
                return
            }
            strawberryCount -= fruitNameAndCount.count
        case .banana:
            guard var bananaCount = fruitStore.banana else {
                return
            }
            bananaCount -= fruitNameAndCount.count
        case .pineapple:
            guard var pineappleCount = fruitStore.pineapple else {
                return
            }
            pineappleCount -= fruitNameAndCount.count
        case .kiwi:
            guard var kiwiCount = fruitStore.kiwi else {
                return
            }
            kiwiCount -= fruitNameAndCount.count
        case .mango:
            guard var mangoCount = fruitStore.mango else {
                return
            }
            mangoCount -= fruitNameAndCount.count
        }
    }
}
