//
//  JuiceMaker - FruitStore.swift
//  Created by safari and Red. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class FruitStore {
    private(set) var stock: [Fruit: Int]
    
    init(defaultStock: Int = 10) {
        stock = [.strawberry: defaultStock,
                 .banana: defaultStock,
                 .pineapple: defaultStock,
                 .kiwi: defaultStock,
                 .mango: defaultStock]
    }
    
    func isEnoughStock(of fruit: (Fruit, Int)) -> Bool {
        let (neededFruit, neededStock) = fruit
        let inStock: Int = stock[neededFruit] ?? Int.zero
        return inStock >= neededStock ? true : false
    }
    
    func changeStock(of fruit: Fruit, to numberOfFruit: Int) {
        guard var inStock: Int = stock[fruit] else { return }
        inStock += numberOfFruit
        stock[fruit] = inStock
    }
    
    func updateStock(to stock: [Fruit: Int]) {
        self.stock = stock
    }
    
    func getStock(of fruit: Fruit) -> String {
        let amount = stock[fruit] ?? 0
        return String(amount)
    }
    

}


