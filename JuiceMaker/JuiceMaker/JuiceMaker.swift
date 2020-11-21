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
        case .ddalbaJuice:
            guard strawberry.showCurrentStock(to: self) >= 10,
                  banana.showCurrentStock(to: self) >= 1 else {
                print("딸바쥬스를 만들 재고가 충분하지 않습니다.")
                return
            }
            
            reducingStock(amount: 10, of: strawberry)
            reducingStock(amount: 1, of: banana)
            
        case .mangoJuice:
            guard mango.showCurrentStock(to: self) >= 3 else {
                print("망고쥬스를 만들 재고가 충분하지 않습니다.")
                return
            }
            
            reducingStock(amount: 3, of: banana)
            
        case .mangoKiwiJuice:
            guard mango.showCurrentStock(to: self) >= 2,
                  kiwi.showCurrentStock(to: self) >= 1 else {
                print("망고키위쥬스를 만들 재고가 충분하지 않습니다.")
                return
            }
            
            reducingStock(amount: 2, of: mango)
            reducingStock(amount: 1, of: kiwi)
            
        case .kiwiJuice:
            guard kiwi.showCurrentStock(to: self) >= 3 else {
                print("키위쥬스를 만들 재고가 충분하지 않습니다.")
                return
            }
            
            reducingStock(amount: 3, of: kiwi)
            
        case .pineappleJuice:
            guard pineapple.showCurrentStock(to: self) >= 2 else {
                print("파인애플쥬스를 만들 재고가 충분하지 않습니다.")
                return
            }
            
            reducingStock(amount: 2, of: pineapple)
            
        }
        
        doneMakingJuice(of: order)
    }
    
    private func doneMakingJuice(of menu: JuiceMenu) {
        print("\(menu.rawValue) 가 완성되었습니다. 맛있게 드세요 :)")
    }
}


