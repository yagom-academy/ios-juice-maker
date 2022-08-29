//
//  JuiceMaker - FruitStore.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    var strawBerry = 10
    var banana = 10
    var pineApple = 10
    var kiwi = 10
    var mango = 10
    
    func changeInventory(_ fruit: Fruit,_ count: Int) {
        switch fruit {
        case .strawBerry:
            self.strawBerry += count
        case .banana:
            self.banana += count
        case .pineApple:
            self.pineApple += count
        case .kiwi:
            self.kiwi += count
        case .mango:
            self.mango += count
        }
    }
}

