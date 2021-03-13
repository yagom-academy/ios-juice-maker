//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

/// 쥬스 메이커 타입


class JuiceMaker {
    static let shared = JuiceMaker()
    
    private func checkStock(of fruit: Fruit) {
        print("\(fruit)는 현재 \(fruit.stock)개 남아있습니다.")
    }
    
    func make(_ menu: Juice) {
        if menu.canMake {
            for requirement in menu.requirements {
                requirement.Fruit.subtractStock(amount: requirement.needAmount)
                print(requirement.Fruit.stock)
            }
        } else {
            for requirement in menu.requirements {
                if requirement.needAmount > requirement.Fruit.stock {
                    print("\(requirement.Fruit)의 현재 재고: \(requirement.Fruit.stock), 필요량: \(requirement.needAmount)")
                }
            }
        }
    }
    
    private func addStock(_ amount: Int, for fruit: Fruit) {
        fruit.addStock(amount)
    }
}
