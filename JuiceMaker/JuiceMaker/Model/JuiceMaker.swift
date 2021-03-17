//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

/// 쥬스 메이커 타입


class JuiceMaker {
    class func make(menu: Juice) {
        for requirement in menu.requirements {
            requirement.Fruit.subtractStock(amount: requirement.needAmount)
        }
    }
    
    func addStock(fruit: Fruit, amount: Int) {
        fruit.addStock(amount: amount)
    }
}
