//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

/// 쥬스 메이커 타입 
struct JuiceMaker {
    
    private var strawberry = Fruit(name: "strawberry")
    private var banana = Fruit(name: "banana")
    private var pineapple = Fruit(name: "pineapple")
    private var kiwi = Fruit(name: "kiwi")
    private var mango = Fruit(name: "mango")
    
    func checkCurrentStock(of fruitType: Fruit) -> Int {
        return fruitType.showCurrentStock()
    }
    
    mutating func makeJuice(of order: JuiceMenu) {
        switch order {
        case .ddalbaJuice:
            guard strawberry.showCurrentStock() >= 10,
                  banana.showCurrentStock() >= 1 else {
                print("딸바쥬스를 만들 재고가 충분하지 않습니다.")
                return
            }
            
            strawberry.changeStockAmount(reducing: 10)
            banana.changeStockAmount(reducing: 1)
            
            print("딸바완성!")
            
        case .mangoJuice:
            guard mango.showCurrentStock() >= 3 else {
                print("망고쥬스를 만들 재고가 충분하지 않습니다.")
                return
            }
            
            mango.changeStockAmount(reducing: 3)
            
            print("망고완성!")
            
        case .mangoKiwiJuice:
            guard mango.showCurrentStock() >= 2,
                  kiwi.showCurrentStock() >= 1 else {
                print("망고키위쥬스를 만들 재고가 충분하지 않습니다.")
                return
            }
            
            mango.changeStockAmount(reducing: 2)
            kiwi.changeStockAmount(reducing: 1)
            
            print("망고키위완성!")
            
        case .kiwiJuice:
            guard kiwi.showCurrentStock() >= 3 else {
                print("키위쥬스를 만들 재고가 충분하지 않습니다.")
                return
            }
            
            kiwi.changeStockAmount(reducing: 3)
            print("키위완성!")
            
        case .pineappleJuice:
            guard pineapple.showCurrentStock() >= 2 else {
                print("파인애플쥬스를 만들 재고가 충분하지 않습니다.")
                return
            }
            
            pineapple.changeStockAmount(reducing: 2)
            print("파인애플완성!")
        }
    }
}

