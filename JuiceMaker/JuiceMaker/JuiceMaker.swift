//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Fruit {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
}

enum Juice: String {
    case strawberryJuice = "딸기쥬스"
    case bananaJuice = "바나나쥬스"
    case kiwiJuice = "키위쥬스"
    case pineappleJuice = "파인애플쥬스"
    case strawberryAndBananaJuice = "딸바쥬스"
    case mangoJuice = "망고쥬스"
    case mangoAndKiwiJuice = "망키쥬스"
}

/// 쥬스 메이커 타입 
class JuiceMaker {
    var fruitStock = FruitStock()

    func makeJuice(_ order: Juice) {
        switch fruitStock.isFruitEnough(order: order) {
        case true:
            fruitStock.useFruit(order: order)
            print("\(order) 나왔습니다! 맛있게 드세요 :)")
        case false:
            print("재료가 모자라요. 재고를 수정할까요?")
        }
    }
    
    func addFruit(_ fruit: Fruit) {
        fruitStock.addOneFruit(fruit)
    }
    
    func minusFruit(_ fruit: Fruit) {
        fruitStock.minusOneFruit(fruit)
    }
}

// 재고 관리 구조체 -> 클래스
class FruitStock {
    // 과일 재고
    private(set) var strawberry: Int
    private(set) var banana: Int
    private(set) var pineapple: Int
    private(set) var kiwi: Int
    private(set) var mango: Int
    
    init(strawberry: Int, banana: Int, pineapple: Int, kiwi: Int, mango: Int) {
        self.strawberry = strawberry
        self.banana = banana
        self.pineapple = pineapple
        self.kiwi = kiwi
        self.mango = mango
    }
    
    init(initialFruitNumber: Int) {
        self.strawberry = initialFruitNumber
        self.banana = initialFruitNumber
        self.pineapple = initialFruitNumber
        self.kiwi = initialFruitNumber
        self.mango = initialFruitNumber
    }
    
    // 과일 재고 추가/제거
    fileprivate func addOneFruit(_ fruit: Fruit) {
        switch fruit {
        case .strawberry:
            strawberry += 1
        case .banana:
            banana += 1
        case .pineapple:
            pineapple += 1
        case .kiwi:
            kiwi += 1
        case .mango:
            mango += 1
        }
    }
    
    fileprivate func minusOneFruit(_ fruit: Fruit) {
        switch fruit {
        case .strawberry:
            strawberry -= 1
        case .banana:
            banana -= 1
        case .pineapple:
            pineapple -= 1
        case .kiwi:
            kiwi -= 1
        case .mango:
            mango -= 1
        }
    }
    
    // 과일 재고 확인하기
    func isFruitEnough(order: Juice) -> Bool {
        switch order {
        case .strawberryJuice:
            return strawberry - 16 < 0 ? false : true
        case .bananaJuice:
            return banana - 2 < 0 ? false : true
        case .kiwiJuice:
            return kiwi - 3 < 0 ? false : true
        case .pineappleJuice:
            return pineapple - 2 < 0 ? false : true
        case .strawberryAndBananaJuice:
            return strawberry - 10 < 0 || banana - 1 < 0 ? false : true
        case .mangoJuice:
            return mango - 3 < 0 ? false : true
        case .mangoAndKiwiJuice:
            return mango - 2 < 0 || kiwi - 1 < 0 ? false : true
        }
    }
    
    fileprivate func useFruit(order: Juice) {
        switch order {
        case .strawberryJuice:
            strawberry -= 16
        case .bananaJuice:
            banana -= 2
        case .kiwiJuice:
            kiwi -= 3
        case .pineappleJuice:
            pineapple -= 2
        case .strawberryAndBananaJuice:
            strawberry -= 10
            banana -= 1
        case .mangoJuice:
            mango -= 3
        case .mangoAndKiwiJuice:
            mango -= 2
            kiwi -= 1
        }
    }
}


