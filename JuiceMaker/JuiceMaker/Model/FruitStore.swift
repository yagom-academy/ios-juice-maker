//
//  JuiceMaker - FruitStore.swift
//  Created by Wonbi, woong
//

class FruitStore {
    private var stock: [Int]
    
    init(stockCount: Int) {
        self.stock = [Int](repeating: stockCount, count: Fruit.allCases.count)
    }
    
    private func haveInStock(fruits: [Fruit], counts: [Int]) -> Bool {
        let recipe = zip(fruits, counts)
        
        for (fruit, count) in recipe {
            let stockCount = stock[fruit.index]
            
            if stockCount < count {
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
    
    func canSupplyRequest(fruits: [Fruit], counts: [Int]) -> Bool {
        guard haveInStock(fruits: fruits, counts: counts) else {
            print("재고가 부족합니다.")
            return false
        }
        
        let recipe = zip(fruits, counts)
        
        for (fruit, count) in recipe {
            addStock(fruit: fruit, count: count, isNegative: true)
        }
        return true
    }
}
