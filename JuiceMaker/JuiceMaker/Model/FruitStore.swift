//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class FruitStore {
    private(set) var stock = [Fruit: Int]() {
        didSet {
            NotificationCenter.default.post(name: .notifyStock, object: nil, userInfo: ["stock": stock])
        }
    }
    
    init(amount: Int = 10) {
        Fruit.allCases.forEach {
            stock[$0] = amount
        }
    }
    
    func hasFruit(menu: Menu) -> Bool {
        let necessaryFruit = menu.needsForFruits()
        
        for (fruit, need) in necessaryFruit {
            guard let number = stock[fruit] else {
                continue
            }
            if number < need {
                return false
            }
        }
        return true
    }
    
    func decreaseStock(menu: Menu) {
        let necessaryFruit = menu.needsForFruits()
        
        for (fruit, need) in necessaryFruit {
            guard let number = stock[fruit] else {
                return
            }
            stock[fruit] = number - need
        }
    }
    
    func fillStock(fruit: Fruit, total: Int) {
        guard let number = stock[fruit] else {
            return
        }
        stock[fruit] = number + total
    }
}

extension Notification.Name {
    static let notifyStock = Notification.Name("notifyStock")
}
