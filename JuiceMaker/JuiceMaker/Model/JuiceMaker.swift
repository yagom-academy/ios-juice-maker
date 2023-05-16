//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

struct JuiceMaker {
    private let fruitStore = FruitStore(fruitInventory: [
        .strawberry: 10,
        .banana: 10,
        .pineapple: 10,
        .kiwi: 10,
        .mango: 10
    ])
    
    func takeOrder(_ juice: Juice) -> Bool {
        do {
            try makeJuice(juice)
            return true
//            print("\(juice.name) 나왔습니다! 맛있게 드세요!")
        } catch FruitStoreError.invalidFruit {
            return false
//            print("올바르지 않은 과일 이름입니다.")
        } catch FruitStoreError.insufficientFruit {
            return false
//            print("재료가 모자라요. 재고를 수정할까요?")
        } catch {
            return false
//            print("알 수 없는 에러입니다.")
        }
    }
    
    private func makeJuice(_ juice: Juice) throws {
        try verifyStock(for: juice)
        try consumeFruit(for: juice)
    }

    private func verifyStock(for juice: Juice) throws {
        for (fruit, amount) in juice.recipe {
            try fruitStore.isStockSufficient(fruit, with: amount)
        }
    }
        
    private func consumeFruit(for juice: Juice) throws {
        for (fruit, amount) in juice.recipe {
            try fruitStore.decreaseFruitStock(fruit, by: amount)
        }
    }
}
