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
    var strawberry: Int?
    var banana: Int?
    var pineapple: Int?
    var kiwi: Int?
    var mango: Int?
    
    init() {
        
    }
    
    func checkSufficientStock(recipe: [Ingredient]) -> Bool {
        for fruitNameAndCount in recipe {
            switch fruitNameAndCount.fruitName {
            case .strawberry:
                if self.strawberry ?? 0 < fruitNameAndCount.count {
                    print("\(fruitNameAndCount.fruitName.koreanName)의 재고가 부족합니다!")
                    return false
                }
            case .banana:
                if self.banana ?? 0 < fruitNameAndCount.count {
                    print("\(fruitNameAndCount.fruitName.koreanName)의 재고가 부족합니다!")
                    return false
                }
            case .pineapple:
                if self.pineapple ?? 0 < fruitNameAndCount.count {
                    print("\(fruitNameAndCount.fruitName.koreanName)의 재고가 부족합니다!")
                    return false
                }
            case .kiwi:
                if self.kiwi ?? 0 < fruitNameAndCount.count {
                    print("\(fruitNameAndCount.fruitName.koreanName)의 재고가 부족합니다!")
                    return false
                }
            case .mango:
                if self.mango ?? 0 < fruitNameAndCount.count {
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
                guard var strawberryCount = self.strawberry else {
                    return
                }
                strawberryCount -= fruitNameAndCount.count
            case .banana:
                guard var bananaCount = self.banana else {
                    return
                }
                bananaCount -= fruitNameAndCount.count
            case .pineapple:
                guard var pineappleCount = self.pineapple else {
                    return
                }
                pineappleCount -= fruitNameAndCount.count
            case .kiwi:
                guard var kiwiCount = self.kiwi else {
                    return
                }
                kiwiCount -= fruitNameAndCount.count
            case .mango:
                guard var mangoCount = self.mango else {
                    return
                }
                mangoCount -= fruitNameAndCount.count
            }
        }
    }
}
