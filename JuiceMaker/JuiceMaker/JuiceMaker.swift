//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Fruits {
    case strawberry, banana, pineapple, kiwi, mango
}

struct FruitsLabel {
    let fruits: [String] = ["strawberry", "banana", "pineapple", "kiwi", "mango"]
}

class FruitStock: NSObject {
    @objc fileprivate(set) var strawberry: Int
    @objc fileprivate(set) var banana: Int
    @objc fileprivate(set) var pineapple: Int
    @objc fileprivate(set) var kiwi: Int
    @objc fileprivate(set) var mango: Int
    
    let instanceForSuperInit = NSObject()
    
    init(strawberry: Int, banana: Int, pineapple: Int, kiwi: Int, mango: Int) {
        self.strawberry = strawberry
        self.banana = banana
        self.pineapple = pineapple
        self.kiwi = kiwi
        self.mango = mango
    }
    
    
    func addStocks(fruitsName: Fruits, amount: Int) {
        let fruit = "\(fruitsName)"
        if FruitsLabel().fruits.contains(fruit) {
            if let addFruit = value(forKey: fruit) as? Int {
                setValue(addFruit + amount, forKey: fruit)
            } else {
                print("존재하지 않는 과일입니다. 알림 구현")
            }
        }
    }
}

class JuiceMaker: FruitStock {
    
    func makeOriginalJuice(material fruit: Fruits) {
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
    
    func makeMixedJuice(fruit1: Fruits, fruit2: Fruits) {
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
