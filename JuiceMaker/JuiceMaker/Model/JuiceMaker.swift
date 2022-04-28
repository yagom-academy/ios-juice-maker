//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

struct JuiceMaker {
    private var store = FruitStore()
        
    private func checkStock(menu: Menu, total: Int) throws {
        for (fruit, need) in menu.notifyRecipe() {
            guard let number = store.stock[fruit],
                   number >= need * total
            else {
                throw JuiceMakerError.lackOfStock
            }
        }
    }
    
    func make(menu: Menu, total: Int) {
        do {
            try checkStock(menu: menu, total: total)
            store.decreaseStock(menu: menu, total: total)
        } catch {
            store.fillStock(fruits: menu.classifyKey(from: menu))
        }
    }
}
