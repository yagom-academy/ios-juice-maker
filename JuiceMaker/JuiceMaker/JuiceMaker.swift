//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

/// 쥬스 메이커 타입 
struct JuiceMaker {
    private var fruitStockList: [Fruit] = []
    
    private var strawberry = Fruit(fruitName: "strawberry", currentStock: 10)
    private var banana = Fruit(fruitName: "banana", currentStock: 10)
    private var pineapple = Fruit(fruitName: "pineapple", currentStock: 10)
    private var kiwi = Fruit(fruitName: "kiwi", currentStock: 10)
    private var mango = Fruit(fruitName: "mango", currentStock: 10)
    
    
    init() {
        self.fruitStockList = initiallizeFruitStockList()
    }
    
    private mutating func initiallizeFruitStockList() -> [Fruit] {
        fruitStockList.append(strawberry)
        fruitStockList.append(banana)
        fruitStockList.append(pineapple)
        fruitStockList.append(kiwi)
        fruitStockList.append(mango)
        
        return fruitStockList
    }
    
    func checkStock(of fruitType: Fruit) -> Int {
        return fruitType.currentStock
    }
    
    mutating func makeJuice(of order: JuiceMenu) {
        switch order {
        case .딸바쥬스:
            guard strawberry.currentStock >= 10,
                  banana.currentStock >= 1 else {
                print("딸바쥬스를 만들 재고가 충분하지 않습니다.")
                return
            }
            
            updateStock(of: &strawberry, adding: -10)
            updateStock(of: &banana, adding: -1)

        case .망고쥬스:
            guard mango.currentStock >= 3 else {
                print("망고쥬스를 만들 재고가 충분하지 않습니다.")
                return
            }
            
            updateStock(of: &mango, adding: -3)
            
        case .망고키위쥬스:
            guard mango.currentStock >= 2,
                  kiwi.currentStock >= 1 else {
                print("망고키위쥬스를 만들 재고가 충분하지 않습니다.")
                return
            }
            
            updateStock(of: &mango, adding: -2)
            updateStock(of: &kiwi, adding: -1)
            
        case .키위쥬스:
            guard kiwi.currentStock >= 3 else {
                print("키위쥬스를 만들 재고가 충분하지 않습니다.")
                return
            }
            
            updateStock(of: &kiwi, adding: -3)
            
        case .파인애플쥬스:
            guard pineapple.currentStock >= 2 else {
                print("파인애플쥬스를 만들 재고가 충분하지 않습니다.")
                return
            }
            
            updateStock(of: &pineapple, adding: -2)
            
        }
    }
    
    func updateStock(of fruitType: inout Fruit, adding amount: Int) {
        fruitType.previousStock = fruitType.currentStock
        fruitType.addedStock = amount
    }
}

