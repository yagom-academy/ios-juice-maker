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
    
    // 과일 소비량 상수화
    private struct OriginalJuiceConsumption {
        static let strawberry: UInt = 16
        static let banana: UInt = 2
        static let pineapple: UInt = 2
        static let kiwi: UInt = 3
        static let mango: UInt = 3
    }
    // 과일 소비량 상수화
    private struct MixedJuiceConsumption {
        static var strawberry: UInt = 0
        static var banana: UInt = 0
        static var pineapple: UInt = 0
        static var kiwi: UInt = 0
        static var mango: UInt = 0
        
        static var ddlaba: (strawberry: UInt, banana: UInt) {
            self.strawberry = 10
            self.banana = 1
            return (strawberry, banana)
        }
        
        static var mangki: (kiwi: UInt, mango: UInt) {
            self.kiwi = 2
            self.mango = 1
            return (kiwi, mango)
        }
    }
    
    // 한 종류의 과일을 소모하는 쥬스의 과일 소비량
    private func consumeFruit(fruit: Fruit) -> UInt {
        switch fruit {
        case .strawberry:
            return OriginalJuiceConsumption.strawberry
        case .banana:
            return OriginalJuiceConsumption.banana
        case .pineapple:
            return OriginalJuiceConsumption.kiwi
        case .kiwi:
            return OriginalJuiceConsumption.kiwi
        case .mango:
            return OriginalJuiceConsumption.mango
        }
    }
    
    // 두 종류 이상의 과일을 소모하는 쥬스의 과일 소비량
    private func consumeFruit(fruit1: Fruit, fruit2: Fruit) -> (UInt, UInt) {
        switch (fruit1, fruit2) {
        case (.strawberry, .banana), (.banana, .strawberry):
            return MixedJuiceConsumption.ddlaba
        case (.kiwi, .mango), (.mango, .kiwi):
            return MixedJuiceConsumption.mangki
        default:
            return (0, 0)
        }
    }
    
    // 한 종류의 과일을 소모하는 쥬스를 만들기 위한 사전 재고 확인
    private func checkAndRenewStock(fruitStock: UInt, fruitName fruit: Fruit) -> UInt {
        var currentStock = fruitStock
        if currentStock >= consumeFruit(fruit: fruit) {
            print(fruit.rawValue + completionSentence)
            currentStock -= consumeFruit(fruit: fruit)
        } else {
            print(adjustmentSentence)
        }
        return currentStock
    }
    
    // 두 종류 이상의 과일을 소모하는 쥬스를 만들기 위한 사전 재고 확인
    private func checkAndRenewStock(fruitStock1: UInt, fruitStock2: UInt, fruitName fruit: (Fruit, Fruit)) -> (UInt, UInt) {
        var currentStock1 = fruitStock1
        var currentStock2 = fruitStock2
        if (currentStock1, currentStock2) >= consumeFruit(fruit1: fruit.0, fruit2: fruit.1) {
            print(fruit.0.rawValue + fruit.1.rawValue + completionSentence)
            currentStock1 -= consumeFruit(fruit1: fruit.0, fruit2: fruit.1).0
            currentStock2 -= consumeFruit(fruit1: fruit.0, fruit2: fruit.1).1
        } else {
            print(adjustmentSentence)
        }
        return (currentStock1, currentStock2)
    }
    
    // 한 종류의 과일을 소모하여 만드는 쥬스
    func makeOriginalJuice(material fruit: Fruit) {
        switch fruit {
        case .strawberry:
            strawberry = checkAndRenewStock(fruitStock: strawberry, fruitName: .strawberry)
        case .banana:
            banana = checkAndRenewStock(fruitStock: banana, fruitName: .banana)
        case .pineapple:
            pineapple = checkAndRenewStock(fruitStock: pineapple, fruitName: .pineapple)
        case .kiwi:
            kiwi = checkAndRenewStock(fruitStock: kiwi, fruitName: .kiwi)
        case .mango:
            mango = checkAndRenewStock(fruitStock: mango, fruitName: .mango)
        }
    }
    
    // 두 종류 이상의 과일을 소모하여 만드는 쥬스
    func makeMixedJuice(material fruit: Fruit...) {
        let checkStrawberryCanMixBanana = checkAndRenewStock(fruitStock1: strawberry, fruitStock2: banana, fruitName: (.strawberry, .banana))
        let checkKiwiCanMixMango = checkAndRenewStock(fruitStock1: kiwi, fruitStock2: mango, fruitName: (.kiwi, .mango))
        switch fruit {
        case [.strawberry, .banana]:
            strawberry = checkStrawberryCanMixBanana.0
            banana = checkStrawberryCanMixBanana.1
        case [.kiwi, .mango]:
            kiwi = checkKiwiCanMixMango.0
            mango = checkKiwiCanMixMango.1
        default:
            print("메뉴 준비중입니다!")
        }
    }
}
