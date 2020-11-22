//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

enum FruitsName {
    case strawberry, banana, pineapple, kiwi, mango
}

struct FruitsLabel {
    let fruitsArray: [String] = ["strawberry", "banana", "pineapple", "kiwi", "mango"]
}

class FruitStock: NSObject {
    @objc fileprivate(set) var strawberry: Int = 10
    @objc fileprivate(set) var banana: Int = 10
    @objc fileprivate(set) var pineapple: Int = 10
    @objc fileprivate(set) var kiwi: Int = 10
    @objc fileprivate(set) var mango: Int = 10
    
    func addStocks(fruitsName: FruitsName, amount: Int) {
        for fruit in FruitsLabel().fruitsArray {
            if fruit == "\(fruitsName)" {
                if let addFruit = value(forKey: fruit) as? Int {
                    setValue(addFruit + amount, forKey: fruit)
                } else {
                    print("존재하지 않는 과일입니다. 알림 구현")
                }
            }
        }
    }
}

class JuiceMaker: FruitStock {
    func makeOriginalJuice(material fruit: FruitsName) {
        switch fruit {
        case .strawberry:
            strawberry -= 16
        case .banana:
            banana -= 2
        case .pineapple:
            pineapple -= 2
        case .kiwi:
            kiwi -= 3
        case .mango:
            mango -= 3
        }
    }
    
    func makeMixedJuice(fruit1: FruitsName, fruit2: FruitsName) {
        switch (fruit1, fruit2) {
        case (.strawberry, .banana), (.banana, .strawberry):
            strawberry -= 10
            banana -= 1
        case (.kiwi, .mango), (.mango, .kiwi):
            kiwi -= 2
            mango -= 1
        default:
            print("메뉴 준비 중이라는 알림 구현")
        }
    }
}
