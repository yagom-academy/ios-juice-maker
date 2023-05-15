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
    
    func takeOrder(_ juice: Juice) {
        do {
            if try canMake(juice) {
                try consumeFruit(for: juice)
                print("\(juice.name) 쥬스가 완성되었습니다.")
            } else {
                print("과일의 재고가 부족하여 쥬스를 만들 수 없습니다.")
            }
        } catch JuiceMakerError.invalidFruit {
            print("올바르지 않은 과일 이름입니다.")
        } catch JuiceMakerError.invalidJuice {
            print("올바르지 않은 쥬스 이름입니다.")
        } catch JuiceMakerError.insufficientFruit {
            print("과일의 재고가 부족하여 쥬스를 만들 수 없습니다.")
        } catch {
            print("알 수 없는 에러입니다.")
        }
    }
    
    private func canMake(_ juice: Juice) throws -> Bool {
        for (fruit, amount) in juice.recipe {
            if !(try fruitStore.isStockSufficient(fruit, with: amount)) {
                return false
            }
        }
        return true
    }
    
    private func consumeFruit(for juice: Juice) throws {
        for (fruit, amount) in juice.recipe {
            try fruitStore.decreaseFruitStock(fruit, amount: amount)
        }
    }
}
