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
    
    func decrease<T: Fruit>(fruitType: T.Type, num: Int) throws {
        switch fruitType {
        case is Strawberry.Type:
            guard strawberry.counter - num >= 0 else {
                throw FruitError.negativeCount
            }
            strawberry.decrease(num: num)
        case is Banana.Type:
            guard banana.counter - num >= 0 else {
                throw FruitError.negativeCount
            }
            banana.decrease(num: num)
        case is Kiwi.Type:
            guard kiwi.counter - num >= 0 else {
                throw FruitError.negativeCount
            }
            kiwi.decrease(num: num)
        case is Pineapple.Type:
            guard pineapple.counter - num >= 0 else {
                throw FruitError.negativeCount
            }
            pineapple.decrease(num: num)
        case is Mango.Type:
            guard mango.counter - num >= 0 else {
                throw FruitError.negativeCount
            }
            mango.decrease(num: num)
        default:
            return
        }
    }
}

