//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

class FruitStore: BindingOptional {
    var stock: [Fruits: Int] = [.strawberry: 10, .banana: 10, .pineapple: 10, .kiwi: 10, .mango: 10]
    private let orderQuantity: [Fruits: Int] = [.strawberry: 80, .banana: 10, .pineapple: 10, .kiwi: 15, .mango: 15]
    
    func decreaseStock(menu: Menu, total: Int) {
        for (fruit, need) in menu.recipe {
            stock[fruit] = unwrapOptional(stock[fruit]) - (need * total)
        }
    }
    
    func fillStock(fruits: [Fruits]) {
        for fruit in fruits {
            stock[fruit] = orderQuantity[fruit]
        }
    }
    
    func unwrapOptional(_ stock: Int?) -> Int {
        guard let number = stock else { return 0 }
        return number
    }
}
