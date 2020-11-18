//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

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
    
    // 과일 재고
    var strawberryStock: Int {
        return fruitStock.strawberry
    }
    var bananaStock: Int {
        return fruitStock.banana
    }
    var pineappleStock: Int {
        return fruitStock.pineapple
    }
    var kiwiStock: Int {
        return fruitStock.kiwi
    }
    var mangoStock: Int {
        return fruitStock.mango
    }

    func makeJuice(_ order: Juice) {
        switch fruitStock.checkIsFruitEnough(order: order) {
        case true:
            switch order {
            case .strawberryJuice:
                fruitStock.strawberry -= 16
            case .bananaJuice:
                fruitStock.banana -= 2
            case .kiwiJuice:
                fruitStock.kiwi -= 3
            case .pineappleJuice:
                fruitStock.pineapple -= 2
            case .strawberryAndBananaJuice:
                fruitStock.strawberry -= 10
                fruitStock.banana -= 1
            case .mangoJuice:
                fruitStock.mango -= 3
            case .mangoAndKiwiJuice:
                fruitStock.mango -= 2
                fruitStock.kiwi -= 1
            }
            print("\(order) 나왔습니다! 맛있게 드세요 :)")
            
        case false:
            print("재료가 모자라요. 재고를 수정할까요?")
        }
    }
}

struct FruitStock {
    // 과일 재고
    var strawberry = 10
    var banana = 10
    var pineapple = 10
    var kiwi = 10
    var mango = 10
    
    // 과일 재고 추가/제거
    func addOneFruit(_ fruit: inout Int) {
        fruit += 1
    }
    func minusOneFruit(_ fruit: inout Int) {
        fruit -= 1
    }
    
    // 과일 재고 확인하기
    func checkIsFruitEnough(order: Juice) -> Bool {
        switch order {
        case .strawberryJuice:
            if strawberry - 16 < 0 {
                return false
            }else {
                return true
            }
        case .bananaJuice:
            if banana - 2 < 0 {
                return false
            }else {
                return true
            }
        case .kiwiJuice:
            if kiwi - 3 < 0 {
                return false
            }else {
                return true
            }
        case .pineappleJuice:
            if pineapple - 2 < 0 {
                return false
            }else {
                return true
            }
        case .strawberryAndBananaJuice:
            if strawberry - 10 < 0 || banana - 1 < 0 {
                return false
            }else {
                return true
            }
        case .mangoJuice:
            if mango - 3 < 0 {
                return false
            }else {
                return true
            }
        case .mangoAndKiwiJuice:
            if mango - 2 < 0 || kiwi - 1 < 0 {
                return false
            }else {
                return true
            }
        }
    }
}


