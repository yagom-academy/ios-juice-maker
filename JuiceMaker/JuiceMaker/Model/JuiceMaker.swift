//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    
    let fruitStore = FruitStore(number: 10)
    
    func makeJuice(fruitJuice: FruitJuice) {
        switch fruitJuice {
        case .strawberryJuice:
            if fruitStore.checkFruit(name: .strawberry, count: 16) {
                print("딸기주스 생성")
                fruitStore.reduceFruitOfJuice(of: .strawberryJuice)
            } else {
                print("딸기주스 생성실패")
            }
        case .bananaJuice:
            if fruitStore.checkFruit(name: .banana, count: 2) {
               print("바나나주스 생성")
                fruitStore.reduceFruitOfJuice(of: .bananaJuice)
            } else {
                print("바나나주스 생성실패")
            }
        case .pineappleJuice:
            if fruitStore.checkFruit(name: .pineapple, count: 2) {
                print("파인애플주스 생성")
                fruitStore.reduceFruitOfJuice(of: .pineappleJuice)
             } else {
                 print("파인애플주스 생성실패")
             }
        case .kiwiJuice:
            if fruitStore.checkFruit(name: .kiwi, count: 3) {
                print("키위주스 생성")
                fruitStore.reduceFruitOfJuice(of: .kiwiJuice)
             } else {
                 print("키위주스 생성실패")
             }
        case .mangoJuice:
            if fruitStore.checkFruit(name: .mango, count: 3) {
                print("망고주스 생성")
                fruitStore.reduceFruitOfJuice(of: .mangoJuice)
             } else {
                 print("망고주스 생성실패")
             }
        case .strawberryBananaJuice:
            if fruitStore.checkFruit(name: .strawberry, count: 10), fruitStore.checkFruit(name: .banana, count: 1) {
                print("딸바주스 생성")
                fruitStore.reduceFruitOfJuice(of: .strawberryBananaJuice)
             } else {
                 print("딸바주스 생성실패")
             }
        case .mangoKiwiJuice:
            if fruitStore.checkFruit(name: .mango, count: 2),
               fruitStore.checkFruit(name: .kiwi, count: 1) {
                print("망키주스 생성")
                fruitStore.reduceFruitOfJuice(of: .mangoKiwiJuice)
             } else {
                 print("망키주스 생성실패")
             }
        }
    }
}
