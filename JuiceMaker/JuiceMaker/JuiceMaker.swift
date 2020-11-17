//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

/// 쥬스 메이커 타입

//과일 종류
enum Fruit {
    case strawberry
    case banana
    case pineapple
    case kiwii
    case mango
}

//주스 종류
enum Juice {
    case kiwiiJuice
    case pineappleJuice
    case strawberryBananaJuice
    case mangoJuice
    case mangoKiwiiJuice
}

//과일 수량
struct FruitStock {
    fileprivate var strawberry: Int
    fileprivate var banana: Int
    fileprivate var pineapple: Int
    fileprivate var kiwii: Int
    fileprivate var mango: Int
    
    var strawberryStock: Int {
        get {
            return strawberry
        }
    }
    var bananaStock: Int {
        get {
            return banana
        }
    }
    var pineappleStock: Int {
        get {
            return pineapple
        }
    }
    var kiwiiStock: Int {
        get {
            return kiwii
        }
    }
    var mangoStock: Int {
        get {
            return mango
        }
    }
    
    //과일 재고 추가
    mutating func stockChanged(fruit: Fruit, stock: Int) {
        switch fruit {
        case .strawberry:
            strawberry = stock
        case .banana:
            banana = stock
        case .kiwii:
            kiwii = stock
        case .mango:
            mango = stock
        case .pineapple:
            pineapple = stock
        }
    }
}

//주스 만들기
class JuiceMaker {
    var fruitStock: FruitStock
    
    init() {
        fruitStock = FruitStock(strawberry: 0, banana: 0, pineapple: 0, kiwii: 0, mango: 0)
    }
    
    func makeJuice(juice: Juice) {
        switch juice {
        case .kiwiiJuice:
            self.fruitStock.kiwii -= 3
            
        case .mangoJuice:
            self.fruitStock.mango -= 3
            
        case .mangoKiwiiJuice:
            self.fruitStock.mango -= 2
            self.fruitStock.kiwii -= 1
            
        case .pineappleJuice:
            self.fruitStock.pineapple -= 2
            
        case .strawberryBananaJuice:
            self.fruitStock.strawberry -= 10
            self.fruitStock.banana -= 1
        }
    }
}
