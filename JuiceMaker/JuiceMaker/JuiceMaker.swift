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

class FruitStock: NSObject {
    @objc fileprivate(set) var strawberry: UInt
    @objc fileprivate(set) var banana: UInt
    @objc fileprivate(set) var pineapple: UInt
    @objc fileprivate(set) var kiwi: UInt
    @objc fileprivate(set) var mango: UInt
    
    let instanceForSuperInit = NSObject()
    
    init(strawberry: UInt, banana: UInt, pineapple: UInt, kiwi: UInt, mango: UInt) {
        self.strawberry = strawberry
        self.banana = banana
        self.pineapple = pineapple
        self.kiwi = kiwi
        self.mango = mango
    }
    
    
    func addStocks(fruitsName: Fruits, amount: Int) {
        let fruit = "\(fruitsName)"
        if let fruitsCount = value(forKey: fruit) as? Int {
            setValue(fruitsCount + amount, forKey: fruit)
        } else {
            print("존재하지 않는 과일입니다. 알림 구현")
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
