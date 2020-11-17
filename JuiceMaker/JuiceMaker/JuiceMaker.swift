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
    
    func addStock(of fruitType: Fruit, addingAmount: Int) {
        guard addingAmount > 0 else {
            print("재고를 하나 이상 추가해주세요.")
            return
        }
        
        fruitType.currentStock += addingAmount
    }
    
    func makeJuice(of order: JuiceMenu) {
        switch order {
        case .딸바쥬스:
            guard checkStock(of: strawberry) >= 10,
                  checkStock(of: banana) >= 1 else {
                print("딸바쥬스를 만들 재고가 충분하지 않습니다.")
                return
            }
            
            updateStock(of: strawberry, used: 10)
            updateStock(of: banana, used: 1)
            
        case .망고쥬스:
            guard checkStock(of: mango) >= 3 else {
                print("망고쥬스를 만들 재고가 충분하지 않습니다.")
                return
            }
            
            updateStock(of: mango, used: 3)
            
        case .망고키위쥬스:
            guard checkStock(of: mango) >= 2,
                  checkStock(of: kiwi) >= 1 else {
                print("망고키위쥬스를 만들 재고가 충분하지 않습니다.")
                return
            }
            
            updateStock(of: mango, used: 2)
            updateStock(of: kiwi, used: 1)
            
        case .키위쥬스:
            guard checkStock(of: kiwi) >= 3 else {
                print("키위쥬스를 만들 재고가 충분하지 않습니다.")
                return
            }
            
            updateStock(of: kiwi, used: 3)
            
        case .파인애플쥬스:
            guard checkStock(of: kiwi) >= 2 else {
                print("파인애플쥬스를 만들 재고가 충분하지 않습니다.")
                return
            }
            
            updateStock(of: pineapple, used: 2)
            
        }
    }
    
    private func updateStock(of fruitType: Fruit, used amount: Int) {
        fruitType.currentStock -= amount
    }
}

