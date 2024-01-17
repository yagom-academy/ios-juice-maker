//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Juice {
    case strawberry
    case banana
    case kiwi
    case pineapple
    case strawberryBanana
    case mango
    case mangoKiwi
    
    var requiredIngredient: [Fruit: Int] {
        switch self {
        case .strawberry:
            return [.strawberry: 16]
        case .banana:
            return [.banana: 2]
        case .kiwi:
            return [.kiwi: 3]
        case .pineapple:
            return [.pineapple: 2]
        case .strawberryBanana:
            return [.strawberry: 10, .banana: 1]
        case .mango:
            return [.mango: 3]
        case .mangoKiwi:
            return [.mango: 2, .kiwi: 1]
        }
    }
}

// 쥬스 메이커 타입
struct JuiceMaker {
    var fruitStore = FruitStore()
    
    func checkJuice(juice: Juice) throws {
        for (fruit, amount) in juice.requiredIngredient {
            do {
                try fruitStore.checkStock(fruit: fruit, amount: amount)
            } catch {
                throw JuiceMakerError.cannotPlaceOrder
            }
        }
    }
    
    func makeJuice(juice: Juice) {

        for (fruit, amount) in juice.requiredIngredient {
            do {
                try fruitStore.consumeStock(fruit: fruit, amount: amount)
            } catch FruitStoreError.outOfStock {
                print("과일 개수가 부족합니다.")
            } catch FruitStoreError.fruitNotFound {
                print("해당 과일이 존재하지 않습니다.")
            } catch {
                print("알 수 없는 오류입니다.")
            }
        }
    }
}
