//
//  JuiceMaker - JuiceMaker.swift
//  Created by Doogie & Malrang. 
//  Copyright © yagom academy. All rights reserved.
// 
struct JuiceMaker {
    let store = FruitStore()
    
    func makeJuice(juice: Juice) {
        do {
            try store.checkStock(juice: juice)
        } catch FruitStoreError.outOfStock {
            print("재고 없음!")
        } catch FruitStoreError.invalidSelection {
            print("선택된 과일이 없습니다.")
        } catch {}
    }
    
    func manageStock(fruit: Fruits, amount: Int, calculationType: CalculationType) {
        do {
            try store.calculateStock(fruit: fruit, amount: amount, calculationType: calculationType)
        } catch FruitStoreError.outOfStock {
            print("현재 재고가 \(amount)개 미만입니다.")
        } catch {}
    }
}
