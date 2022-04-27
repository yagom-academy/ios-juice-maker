//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

struct JuiceMaker: BindingOptional {
    private var store = FruitStore()
        
    func checkStock(menu: Menu, total: Int) throws {
        for (fruit, need) in menu.recipe {
            guard unwrapOptional(store.stock[fruit]) >= need * total else { throw JuiceMakerError.lackOfStock }
        }
    }
    
    func make(menu: Menu, total: Int) {
        do {
            try checkStock(menu: menu, total: total)
            store.decreaseStock(menu: menu, total: total)
        } catch {
            store.fillStock(fruits: classifyKey(from: menu))
        }
    }
    
    func classifyKey(from juice: Menu) -> [Fruits] {
        var keys: [Fruits] = []
        
        for keyValue in juice.recipe.keys {
            keys.append(keyValue)
        }
        return keys
    }
    
    func unwrapOptional(_ stock: Int?) -> Int {
        guard let number = stock else { return 0 }
        return number
    }
}
