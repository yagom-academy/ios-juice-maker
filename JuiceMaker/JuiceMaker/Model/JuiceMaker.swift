//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

struct JuiceMaker {
    private var fruitStore: FruitStore
    
    init(store: FruitStore) {
        self.fruitStore = store
    }
    
    mutating func takeOrder(_ juice: Juice) {
        do {
            try makeJuice(juice)
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
    
    mutating func makeJuice(_ juice: Juice) throws {
        for (fruit, amount) in juice.recipe {
            if try fruitStore.isStockSufficient(fruit, with: amount) {
                try fruitStore.decreaseFruitStock(fruit, amount: amount)
            } else {
                throw JuiceMakerError.insufficientFruit
            }
        }
        print("\(juice.name) 쥬스가 완성되었습니다.")
    }
}
