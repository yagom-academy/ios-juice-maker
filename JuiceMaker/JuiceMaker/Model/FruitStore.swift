//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

class FruitStore {
    private var stock: [Fruit: Int] = [.strawberry: 10, .banana: 10, .pineapple: 10, .kiwi: 10, .mango: 10]
    
    func notifyStock(fruit: Fruit) -> Int {
        guard let currentCount = stock[fruit] else {
            return 0
        }
        return currentCount
    }
    
    private func hasFruit(menu: Menu) -> Bool {
        let necessaryFruit = menu.count()
        
        for (fruit, need) in necessaryFruit {
            guard let number = stock[fruit] else { continue }
            if number < need {
                return false
            }
        }
        return true
    }
    
    func decreaseStock(menu: Menu) throws {
        let necessaryFruit = menu.count()
        
        for (fruit, need) in necessaryFruit {
            guard hasFruit(menu: menu) else {
                throw JuiceMakerError.lackOfStock
            }
            
            guard let number = stock[fruit] else {
                return
            }
            
            stock[fruit] = number - need
        }
    }
    
    func fillStock(fruit: Fruit, total: Int) {
        guard let number = stock[fruit] else { return }
        stock[fruit] = number + total
    }
}
