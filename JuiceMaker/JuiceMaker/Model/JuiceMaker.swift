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
        } catch {
            print("알 수 없는 오류 발생.")
        }
    }
    
    func checkStock(menu: Menu) throws {
        for (ingredent, amount) in menu.recipe {
            guard let stock = store.fruitList[ingredent] else {
                throw FruitStoreError.invalidSelection
            }
            guard amount <= stock else {
                throw FruitStoreError.outOfStock
            }
        }
        
        for (ingredent, amount) in menu.recipe {
            try store.calculateStock(fruit: ingredent, amount: amount, calculationType: .minus)
        }
    }
}

