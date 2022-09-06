//
//  JuiceMaker - FruitStore.swift
//  Created by Wonbi, woong
//

import Foundation

class FruitStore {
    private(set) var stock: [Int] {
        didSet {
            NotificationCenter.default.post(name: .changedStockCount,
                                            object: nil,
                                            userInfo: nil)
        }
    }
    
    init(stockCount: Int) {
        let count = Fruit.allCases.count
        self.stock = [Int](repeating: stockCount, count: count)
        print("만들어져벌임...")
    }
    
    private func haveInStock(ingredient: [(Fruit, Int)]) -> Bool {
        for (fruit, count) in ingredient {
            let stockCount = stock[fruit.index]
            
            if stockCount < count {
                return false
            }
        }
        return true
    }
    
    private func changeStock(fruit: Fruit, count: Int, isMinus: Bool = false) {
        let stockCount = stock[fruit.index]
        
        var computedCount: Int {
            isMinus ? stockCount - count : stockCount + count
        }
        
        stock[fruit.index] = computedCount
    }
    
    func canSupplyRequest(ingredient: [(Fruit, Int)]) -> Bool {
        guard haveInStock(ingredient: ingredient) else {
            print("재고가 부족합니다.")
            return false
        }
        print(stock)
        for (fruit, count) in ingredient {
            changeStock(fruit: fruit, count: count, isMinus: true)
        }
        print(stock)
        return true
    }
}
