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
        } catch let error as FruitStoreError {
            switch error {
            case .outOfStock:
                print("재고가 부족 합니다.")
            case .invalidSelection:
                print("선택된 과일이 없습니다.")
            }
        } catch {
            print("알수없는 오류")
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

