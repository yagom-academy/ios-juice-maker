//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

// 쥬스 메이커 타입
struct JuiceMaker {
    private let fruitStore: FruitStore = FruitStore()
    
    func start(_ juiceName: String) {
        do {
            try makeJuice("딸기주스")
        } catch FruitStoreError.countError {
            print("재고가 부족합니다.")
        } catch {
            print(error)
        }
    }
    
    private func makeJuice(_ juiceName: String) throws {
        try checkFruitStock(juiceName)
        fruitStore.removeFruit(juiceName)
    }
    
    private func checkFruitStock(_ juiceName: String) throws {
        switch juiceName {
        case "딸기주스":
            guard fruitStore.strawBerry > 16 else {
                throw FruitStoreError.countError
            }
        case "바나나주스":
            guard fruitStore.banana > 2 else {
                throw FruitStoreError.countError
            }
        case "키위주스":
            guard fruitStore.kiwi > 3 else {
                throw FruitStoreError.countError
            }
        case "파인애플주스":
            guard fruitStore.pineApple > 2 else {
                throw FruitStoreError.countError
            }
        case "딸바주스":
            guard fruitStore.strawBerry > 10, fruitStore.banana > 1 else {
                throw FruitStoreError.countError
            }
        case "망고주스":
            guard fruitStore.mango > 3 else {
                throw FruitStoreError.countError
            }
        case "망고키위주스":
            guard fruitStore.mango > 2, fruitStore.kiwi > 1 else {
                throw FruitStoreError.countError
            }
        default:
            print("없는 주스입니다.")
        }
    }
}
