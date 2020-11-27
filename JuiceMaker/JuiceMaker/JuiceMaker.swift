//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Fruit: String {
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
    
    func addStocks(fruitName: Fruit, amount: UInt, isPlus: Bool) {
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
    private var completionSentence: String = " 쥬스 나왔습니다! 맛있게 드세요"
    private let adjustmentSentence = "재료가 모자라요. 재고를 수정할까요?"
    
    private func checkConsumption(fruit: UInt) -> UInt {
        switch fruit {
        case strawberry:
            return 16
        case banana, pineapple:
            return 2
        case kiwi, mango:
            return 3
        default:
            return 0
        }
    }
    
    private func checkCanMakeJuice(currentStock: inout UInt, result fruit: Fruit) {
        if currentStock >= checkConsumption(fruit: currentStock) {
            print(fruit.rawValue + completionSentence)
            currentStock -= checkConsumption(fruit: currentStock)
        } else {
            print(adjustmentSentence)
        }
    }
    
    func makeOriginalJuice(material fruit: Fruit) {
        switch fruit {
        case .strawberry:
            checkCanMakeJuice(currentStock: &strawberry, result: .strawberry)
        case .banana:
            checkCanMakeJuice(currentStock: &banana, result: .banana)
        case .pineapple:
            checkCanMakeJuice(currentStock: &pineapple, result: .pineapple)
        case .kiwi:
            checkCanMakeJuice(currentStock: &kiwi, result: .kiwi)
        case .mango:
            checkCanMakeJuice(currentStock: &mango, result: .mango)
        }
    }
    
    func makeMixedJuice(fruit1: Fruit, fruit2: Fruit) {
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
