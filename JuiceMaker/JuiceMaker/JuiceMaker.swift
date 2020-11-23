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
        
        addStock(amount: initialStock, of: strawberry)
        addStock(amount: initialStock, of: banana)
        addStock(amount: initialStock, of: pineapple)
        addStock(amount: initialStock, of: kiwi)
        addStock(amount: initialStock, of: mango)
        
    }
    
    mutating func addStock(amount: Int, of fruitType: Fruit) {
        fruitType.updateStockAmount(adding: amount)
    }
    
    mutating func reduceStock(amount: Int, of fruitType: Fruit) {
        fruitType.updateStockAmount(reducing: amount)
    }
    
    func checkCurrentStockAmount(of fruitType: Fruit) -> Int {
        return fruitType.currentStockAmount()
    }
    
    mutating func makeJuice(of order: JuiceMenu) {
        switch order {
        case .strawberryJuice:
            reduceStock(amount: 16, of: strawberry)
        case .bananaJuice:
            reduceStock(amount: 2, of: banana)
        case .ddalbaJuice:
            reduceStock(amount: 10, of: strawberry)
            reduceStock(amount: 1, of: banana)
        case .mangoJuice:
            reduceStock(amount: 3, of: mango)
        case .mangoKiwiJuice:
            reduceStock(amount: 2, of: mango)
            reduceStock(amount: 1, of: kiwi)
        case .kiwiJuice:
            reduceStock(amount: 3, of: kiwi)
        case .pineappleJuice:
            reduceStock(amount: 2, of: pineapple)
        }

    }
    
    func isAvailableMaking(juice: JuiceMenu) -> Bool {
        switch juice {
        case .strawberryJuice:
            guard checkCurrentStockAmount(of: strawberry) >= 16 else {
                return false
            }
        case .bananaJuice:
            guard checkCurrentStockAmount(of: banana) >= 2 else {
                return false
            }
        case .ddalbaJuice:
            guard checkCurrentStockAmount(of: strawberry) >= 10,
                  checkCurrentStockAmount(of: banana) >= 1 else {
                return false
            }
        case .kiwiJuice:
            guard checkCurrentStockAmount(of: kiwi) >= 3 else {
                return false
            }
        case .mangoJuice:
            guard checkCurrentStockAmount(of: mango) >= 3 else {
                return false
            }
        case .mangoKiwiJuice:
            guard checkCurrentStockAmount(of: mango) >= 2,
                  checkCurrentStockAmount(of: kiwi) >= 1 else {
                return false
            }
        case .pineappleJuice:
            guard checkCurrentStockAmount(of: pineapple) >= 2 else {
                return false
            }
        }
        return true
    }
    
    func makeSuccessMessage(of menu: JuiceMenu) -> String {
        return "\(menu.rawValue) 가 완성되었습니다. 맛있게 드세요 :)"
    }
}


