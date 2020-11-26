//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Fruits: String {
    case strawberry = "딸기"
    case banana = "바나나"
    case pineapple = "파인애플"
    case kiwi = "키위"
    case mango = "망고"
}

class FruitStock {
    fileprivate(set) var strawberry: UInt
    fileprivate(set) var banana: UInt
    fileprivate(set) var pineapple: UInt
    fileprivate(set) var kiwi: UInt
    fileprivate(set) var mango: UInt
    
    init(strawberry: UInt, banana: UInt, pineapple: UInt, kiwi: UInt, mango: UInt) {
        self.strawberry = strawberry
        self.banana = banana
        self.pineapple = pineapple
        self.kiwi = kiwi
        self.mango = mango
    }
    
    func addStocks(fruitName: Fruits, amount: UInt, isPlus: Bool) {
        switch fruitName {
        case .strawberry where strawberry >= amount:
            strawberry = isPlus ? strawberry + amount : strawberry - amount
        case .banana where banana >= amount:
            banana = isPlus ? banana + amount : banana - amount
        case .pineapple where pineapple >= amount:
            pineapple = isPlus ? pineapple + amount : pineapple - amount
        case .kiwi where kiwi >= amount:
            kiwi = isPlus ? kiwi + amount : kiwi - amount
        case .mango where mango >= amount:
            mango = isPlus ? mango + amount : mango - amount
        default:
            print("현재 남은 수량보다 차감하려는 재고가 더 많습니다. 알람 구현")
        }
    }
}

class JuiceMaker: FruitStock {
    let completionSentence = "쥬스 나왔습니다! 맛있게 드세요"
    let adjustmentSentence = "재료가 모자라요. 재고를 수정할까요?"
    
    
    func makeOriginalJuice(material fruit: Fruits) {
        switch fruit {
        case .strawberry:
            if strawberry >= 16 {
                print(fruit.rawValue + completionSentence)
                strawberry -= 16
            } else {
                print(adjustmentSentence)
            }
        case .banana:
            if banana >= 2 {
                print(fruit.rawValue + completionSentence)
                banana -= 2
            } else {
                print(adjustmentSentence)
            }
        case .pineapple:
            if pineapple >= 2 {
                print(fruit.rawValue + completionSentence)
                pineapple -= 2
            } else {
                print(adjustmentSentence)
            }
        case .kiwi:
            if kiwi >= 3 {
                print(fruit.rawValue + completionSentence)
                kiwi -= 3
            } else {
                print(adjustmentSentence)
            }
        case .mango:
            if mango >= 3 {
                print(fruit.rawValue + completionSentence)
                mango -= 3
            } else {
                print(adjustmentSentence)
            }
        }
    }
    
    func makeMixedJuice(fruit1: Fruits, fruit2: Fruits) {
        switch (fruit1, fruit2) {
        case (.strawberry, .banana), (.banana, .strawberry):
            if strawberry >= 10 && banana >= 1 {
                print(fruit1.rawValue + fruit2.rawValue + completionSentence)
                strawberry -= 10
                banana -= 1
            } else {
                print(adjustmentSentence)
            }
        case (.kiwi, .mango), (.mango, .kiwi):
            print(fruit1.rawValue + fruit2.rawValue + completionSentence)
            kiwi -= 2
            mango -= 1
        default:
            print(adjustmentSentence)
        }
    }
}
