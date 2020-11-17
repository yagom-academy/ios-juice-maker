//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

/// 쥬스 메이커 타입 
struct JuiceMaker {
    private var fruitStockList: [Fruit] = []
    private var menuList: [JuiceMenu] = []
    
    private var strawberry = Fruit(fruitName: "strawberry", currentStock: 10)
    private var banana = Fruit(fruitName: "banana", currentStock: 10)
    private var pineapple = Fruit(fruitName: "pineapple", currentStock: 10)
    private var kiwi = Fruit(fruitName: "kiwi", currentStock: 10)
    private var mango = Fruit(fruitName: "mango", currentStock: 10)
    
    init() {
        self.fruitStockList = initializeFruitStockList()
        self.menuList = initializeMenuList()
    }
    
    private func initializeFruitStockList() -> [Fruit] {
        var initialFruitStockList: [Fruit] = []
        
        initialFruitStockList.append(strawberry)
        initialFruitStockList.append(banana)
        initialFruitStockList.append(pineapple)
        initialFruitStockList.append(kiwi)
        initialFruitStockList.append(mango)
        
        return initialFruitStockList
    }
    
    private func initializeMenuList() -> [JuiceMenu] {
        var initialMenuList = [JuiceMenu]()

        initialMenuList.append(.딸바쥬스)
        initialMenuList.append(.망고쥬스)
        initialMenuList.append(.망고키위쥬스)
        initialMenuList.append(.키위쥬스)
        initialMenuList.append(.파인애플쥬스)

        return initialMenuList
    }
    
    func checkAllStock() {
        for fruitType in fruitStockList {
            print("\(fruitType.fruitName) 재고가 \(fruitType.currentStock) 개 남아있습니다.")
        }
    }
    
    func checkStock(of fruitType: Fruit) -> Int {
        return fruitType.currentStock
    }
    
    
}

