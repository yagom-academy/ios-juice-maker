//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

struct JuiceMaker {
    let store = FruitStore()
        
    func make(menu: Menu) {
        do {
            try store.decreaseStock(menu: menu)
            print("주문하신 음료 나왔습니다.")
        } catch {
            print("재고가 부족합니다.")
        }
    }
}
