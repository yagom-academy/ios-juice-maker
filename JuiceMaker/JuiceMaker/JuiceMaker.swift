//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

/// 쥬스 메이커 타입


class JuiceMaker {
    class func make(_ menu: Juice) {
        for requirement in menu.requirements {
            requirement.Fruit.subtractStock(amount: requirement.needAmount)
        }
    }
    
    func addStock(_ amount: Int, for fruit: Fruit) {
        fruit.addStock(amount)
    }
}
