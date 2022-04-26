//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    var fruitStore = FruitStore()
    
    func makeJuice(juiceName: JuiceKind) throws {
        do{
            switch juiceName {
            case .strawberryJuice:
                try fruitStore.subtractFruitAmount(fruitName: .strawberry, amount: 16)
            case .bananaJuice:
                try fruitStore.subtractFruitAmount(fruitName: .banana, amount: 2)
            case .kiwiJuice:
                try fruitStore.subtractFruitAmount(fruitName: .kiwi, amount: 3)
            case .pineappleJuice:
                try fruitStore.subtractFruitAmount(fruitName: .pineaple, amount: 2)
            case .mangoJuice:
                try fruitStore.subtractFruitAmount(fruitName: .mango, amount: 3)
            case .strawberryBananaJuice:
                try fruitStore.subtractFruitAmount(fruitName: .strawberry, amount: 10)
                try fruitStore.subtractFruitAmount(fruitName: .banana, amount: 1)
            case .mangoKiwiJuice:
                try fruitStore.subtractFruitAmount(fruitName: .mango, amount: 2)
                try fruitStore.subtractFruitAmount(fruitName: .kiwi, amount: 1)
            }
        }catch InputError.zeroError {
            print("\(InputError.zeroError.message)")
        }catch InputError.cannotError {
            print("\(InputError.cannotError.message)")
        }
    }
}
