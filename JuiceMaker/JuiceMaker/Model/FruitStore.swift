//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {

    private var stocks: [Fruit: Int]
    
    init(stocks: [Fruit : Int]) {
        self.stocks = stocks
    }
    
    func checkFruitStock() {
        
    }

    enum Juice {
        case strawberry
        case banana
        case strawberryBanana
        case mango
        case mangoKiwi
        case kiwi
        case pineapple
        
        //주스에 들어가는 재료를 한번에 하면?
        var chooseJuice: [Fruit: Int] {
            switch self {
            case .strawberry:
                return [.strawberry: -16]
            case .banana:
                return [.banana: -2]
            case .strawberryBanana:
                return [.strawberry: -10, .banana: -1]
            case .mango:
                return [.mango: -3]
            case .mangoKiwi:
                return [.mango: -2, .kiwi: -1]
            case .kiwi:
                return [.kiwi: -3]
            case .pineapple:
                return [.pineapple: -2]
            }
        }
    }
}

