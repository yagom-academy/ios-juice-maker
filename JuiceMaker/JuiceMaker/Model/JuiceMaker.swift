//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker: BindingOptional {
    private var store = FruitStore()
    private let menu = Menu.allCases.map({ "\($0)" }).joined(separator: ", ")
        
    func hasFruits(menu: Menu, numberOfOrder: Int) throws {
        for (fruit, need) in menu.recipe {
            guard unwrapOptional(type: store.stock[fruit]) >= need * numberOfOrder else { throw ErrorCase.lackOfStock }
        }
    }
    
    func buy(menu: Menu, numberOfOrder: Int) {
        do {
            try hasFruits(menu: menu, numberOfOrder: numberOfOrder)
            store.decreaseStock(menu: menu, numberOfOrder: numberOfOrder)
        } catch {
            store.fillStock(fruits: classifyKey(menu: menu))
        }
    }
    
    func classifyKey(menu: Menu) -> [Fruits] {
        var keys: [Fruits] = []
        
        for keyValue in menu.recipe.keys {
            keys.append(keyValue)
        }
        return keys
    }
    
    func unwrapOptional(type: Int?) -> Int {
        guard let num = type else { return 0 }
        return num
    }
}
