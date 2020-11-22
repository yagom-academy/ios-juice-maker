//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

/// 쥬스 메이커 타입 
struct JuiceMaker {
    
    var strawberry = Fruit(name: "strawberry")
    var banana = Fruit(name: "banana")
    var pineapple = Fruit(name: "pineapple")
    var kiwi = Fruit(name: "kiwi")
    var mango = Fruit(name: "mango")
    
    init() {
        
        let initialStock = 10
        
        addingStock(amount: initialStock, of: strawberry)
        addingStock(amount: initialStock, of: banana)
        addingStock(amount: initialStock, of: pineapple)
        addingStock(amount: initialStock, of: kiwi)
        addingStock(amount: initialStock, of: mango)
        
    }
    
    mutating func addingStock(amount: Int, of fruitType: Fruit) {
        fruitType.updateStockAmount(adding: amount)
    }
    
    mutating func reducingStock(amount: Int, of fruitType: Fruit) {
        fruitType.updateStockAmount(reducing: amount)
    }
    
    func checkCurrentStockAmount(of fruitType: Fruit) -> Int {
        return fruitType.showCurrentStock(to: self)
    }
    
    mutating func makeJuice(of order: JuiceMenu) {
        switch order {
        case .strawberryJuice:
            reducingStock(amount: 16, of: strawberry)
        case .bananaJuice:
            reducingStock(amount: 2, of: banana)
        case .ddalbaJuice:
            reducingStock(amount: 10, of: strawberry)
            reducingStock(amount: 1, of: banana)
        case .mangoJuice:
            reducingStock(amount: 3, of: mango)
        case .mangoKiwiJuice:
            reducingStock(amount: 2, of: mango)
            reducingStock(amount: 1, of: kiwi)
        case .kiwiJuice:
            reducingStock(amount: 3, of: kiwi)
        case .pineappleJuice:
            reducingStock(amount: 2, of: pineapple)
        }
    }
    
    func isAvailableMaking(juice: JuiceMenu) -> Bool {
        switch juice {
        case .strawberryJuice:
            guard strawberry.showCurrentStock(to: self) >= 16 else {
                return false
            }
        case .bananaJuice:
            guard banana.showCurrentStock(to: self) >= 2 else {
                return false
            }
        case .ddalbaJuice:
            guard strawberry.showCurrentStock(to: self) >= 10,
                  banana.showCurrentStock(to: self) >= 1 else {
                return false
            }
        case .kiwiJuice:
            guard kiwi.showCurrentStock(to: self) >= 3 else {
                return false
            }
        case .mangoJuice:
            guard mango.showCurrentStock(to: self) >= 3 else {
                return false
            }
        case .mangoKiwiJuice:
            guard mango.showCurrentStock(to: self) >= 2,
                  kiwi.showCurrentStock(to: self) >= 1 else {
                return false
            }
        case .pineappleJuice:
            guard pineapple.showCurrentStock(to: self) >= 2 else {
                return false
            }
        }
        return true
    }
    
   func successMakingJuice(of menu: JuiceMenu) -> String {
        return "\(menu.rawValue) 가 완성되었습니다. 맛있게 드세요 :)"
    }
}


