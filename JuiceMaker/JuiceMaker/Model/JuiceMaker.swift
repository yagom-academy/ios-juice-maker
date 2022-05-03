//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

struct JuiceMaker {
    let store = FruitStore(defaultStock: 10)
        
    func make(menu: Menu) throws {
        guard store.hasFruit(menu: menu) else {
            throw JuiceMakerError.lackOfStock
        }
        store.decreaseStock(menu: menu)
    }
}
