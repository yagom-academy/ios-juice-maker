//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
final class FruitStore {
    var strawberry: Strawberry
    var banana: Banana
    var kiwi: Kiwi
    var pineapple: Pineapple
    var mango: Mango
    
    init(strawberryCount: Int, bananaCount: Int, kiwiCount: Int, pineappleCount: Int, mangoCount: Int) {
        self.strawberry = Strawberry(counter: strawberryCount)
        self.banana = Banana(counter: bananaCount)
        self.kiwi = Kiwi(counter: kiwiCount)
        self.pineapple = Pineapple(counter: pineappleCount)
        self.mango = Mango(counter: mangoCount)
    }
    
    func update<T: Fruit>(fruitType: T.Type, num: Int) {
        switch fruitType {
        case is Strawberry.Type:
            strawberry.update(num: num)
        case is Banana.Type:
            banana.update(num: num)
        case is Kiwi.Type:
            kiwi.update(num: num)
        case is Pineapple.Type:
            pineapple.update(num: num)
        case is Mango.Type:
            mango.update(num: num)
        default:
            return
        }
    }
}

