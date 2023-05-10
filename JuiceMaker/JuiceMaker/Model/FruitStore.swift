//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

enum Fruit {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
}

class FruitStore {
    private var strawberry: Int = 10
    private var banana: Int = 10
    private var pineapple: Int = 10
    private var kiwi: Int = 10
    private var mango: Int = 10
    
    func verifyFruitCount(_ fruit: Fruit, count: Int) -> Bool {
        switch fruit {
        case .strawberry:
            return strawberry >= count ? true : false
        case .banana:
            return banana >= count ? true : false
        case .pineapple:
            return pineapple >= count ? true : false
        case .kiwi:
            return kiwi >= count ? true : false
        case .mango:
            return mango >= count ? true : false
        }
    }
    
    func changeFruitCount(_ fruit: Fruit, count: Int, isUseFruit: Bool = true) {
        let amount = isUseFruit ? (count * -1) : count
        
        switch fruit {
        case .strawberry:
            strawberry += amount
        case .banana:
            banana += amount
        case .pineapple:
            pineapple += amount
        case .kiwi:
            kiwi += amount
        case .mango:
            mango += amount
        }
    }
}
