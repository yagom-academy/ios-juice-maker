//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

// 과일 타입
class FruitStore {
    var strawberryStock: Int = 10
    var bananaStock: Int = 10
    var pineappleStock: Int = 10
    var KiwiStock: Int = 10
    var mangoStock: Int = 10

    enum Fruit {
        case strawberry, banana, pineapple, kiwi, mango
    }
    
    func inventoryManagement(name: Fruit, amount : Int) {
        switch name {
        case .strawberry :
            strawberryStock += amount
        case .banana :
            bananaStock += amount
        case .pineapple :
            pineappleStock += amount
        case .kiwi :
            KiwiStock += amount
        case .mango :
            mangoStock += amount
        }
    }
    

}

