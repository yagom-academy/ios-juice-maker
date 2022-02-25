//
//  JuiceMaker - JuiceMaker.swift
//  Created by Doogie & Malrang. 
//  Copyright © yagom academy. All rights reserved.
// 
struct JuiceMaker {
    let store = FruitStore()
    func makeJuice(menu: Menu) {
        do {
            try checkStock(menu: menu)
        } catch FruitStoreError.outOfStock {
            print("재고 없음!")
        } catch FruitStoreError.invalidSelection {
            print("선택된 과일이 없습니다.")
        } catch {}
    }
    
    func checkStock(menu: Menu) throws {
        for (ingredent, amount) in menu.recipie {
            guard let stock = store.fruitList[ingredent] else {
                throw FruitStoreError.invalidSelection
            }
            guard amount <= stock else {
                throw FruitStoreError.outOfStock
            }
        }
        try store.minusStock(menu: menu)
    }
    
    func manageStock(fruit: Fruits, amount: Int, calculationType: CalculationType) {
        do {
            try store.calculateStock(fruit: fruit, amount: amount, calculationType: calculationType)
        } catch FruitStoreError.outOfStock {
            print("현재 재고가 \(amount)개 미만입니다.")
        } catch {}
    }
}

