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
        guard isAvailableMaking(menu: order) else {
            print("\(order.rawValue)를 만들 재고가 충분하지 않습니다.")
            return
        }
        
        switch order {
        case .ddalbaJuice:
            reduceStock(amount: 10, of: strawberry)
            reduceStock(amount: 1, of: banana)
        case .mangoJuice:
            reduceStock(amount: 3, of: banana)
        case .mangoKiwiJuice:
            reduceStock(amount: 2, of: mango)
            reduceStock(amount: 1, of: kiwi)
        case .kiwiJuice:
            reduceStock(amount: 3, of: kiwi)
        case .pineappleJuice:
            reduceStock(amount: 2, of: pineapple)
        }
        
        doneMakingJuice(of: order)
    }
    
    private func isAvailableMaking(menu: JuiceMenu) -> Bool {
        switch menu {
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
    
    private func doneMakingJuice(of menu: JuiceMenu) {
        print("\(menu.rawValue) 가 완성되었습니다. 맛있게 드세요 :)")
    }
}


