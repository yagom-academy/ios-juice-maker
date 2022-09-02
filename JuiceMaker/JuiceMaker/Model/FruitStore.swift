//
//  JuiceMaker - FruitStore.swift
//  Created by Wonbi, woong
//

class FruitStore {
    private var stock = [Int](repeating: 10, count: 5)
    
    private func haveInStock(fruits: [Recipe]) -> Bool {
        for fruit in fruits {
            let stockCount = stock[fruit.name.index]
            let requestedCount = fruit.count
            if stockCount < requestedCount {
                return false
            }
        }
        return true
    }
    
    private func changeStock(_ fruit: Fruit, count: Int) {
        stock[fruit.index] = count
    }
    
    private func addStock(fruit: Fruit, count: Int, isNegative: Bool = false) {
        let stockCount = stock[fruit.index]
        
        var computedCount: Int {
            isNegative ? stockCount - count : stockCount + count
        }
        
        changeStock(fruit, count: computedCount)
    }
    
    func canSupplyRequest(_ fruits: [Recipe]) -> Bool {
        guard haveInStock(fruits: fruits) else {
            print("재고가 부족합니다.")
            return false
        }
        
        for fruit in fruits {
            addStock(fruit: fruit.name, count: fruit.count, isNegative: true)
        }
        return true
    }
}
