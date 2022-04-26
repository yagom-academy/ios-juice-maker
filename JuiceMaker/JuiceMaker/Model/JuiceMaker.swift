//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    private var store = FruitStore()
    private let menu = Menu.allCases.map({ "\($0)" }).joined(separator: ", ")
        
    func hasFruits(menu: Menu, numberOfOrder: Int) -> Bool {
        for (fruit, need) in menu.recipe {
            if store.stock[fruit]! >= need * numberOfOrder {
                return true
            }
        }
        return false
    }
    
    func buy(menu: Menu, numberOfOrder: Int) {
        if hasFruits(menu: menu, numberOfOrder: numberOfOrder) {
            store.decreaseStock(menu: menu, numberOfOrder: numberOfOrder)
        } else {
            store.fillStock(fruit: .strawberry)
        }
    }
}
