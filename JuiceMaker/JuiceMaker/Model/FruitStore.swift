//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
final class FruitStore {
    
    private(set) var strawberry: Strawberry
    private(set) var banana: Banana
    private(set) var kiwi: Kiwi
    private(set) var pineapple: Pineapple
    private(set) var mango: Mango
    
    init(
        strawberryCount: Int,
        bananaCount: Int,
        kiwiCount: Int,
        pineappleCount: Int,
        mangoCount: Int
    ) {
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
    
    func increase<T: Fruit>(fruitType: T.Type, num: Int) {
        switch fruitType {
        case is Strawberry.Type:
            strawberry.increase(num: num)
        case is Banana.Type:
            banana.increase(num: num)
        case is Kiwi.Type:
            kiwi.increase(num: num)
        case is Pineapple.Type:
            pineapple.increase(num: num)
        case is Mango.Type:
            mango.increase(num: num)
        default:
            return
        }
    }
    
    func decrease<T: Fruit>(fruitType: T.Type, num: Int) {
        switch fruitType {
        case is Strawberry.Type:
            strawberry.decrease(num: num)
        case is Banana.Type:
            banana.decrease(num: num)
        case is Kiwi.Type:
            kiwi.decrease(num: num)
        case is Pineapple.Type:
            pineapple.decrease(num: num)
        case is Mango.Type:
            mango.decrease(num: num)
        default:
            return
        }
    }
}

