//
//  JuiceMaker - FruitStore.swift
//  Created by Wonbi, woong
//

class FruitStore {
    static var stockManager = FruitStore()
    private var stock = makeDefaultStock(defaultCount: 10)
    
    private init() {}
    
    static private func makeDefaultStock(defaultCount: Int) -> [Fruits] {
        let fruitList = Fruits.FruitType.makeList()
        var defaultStock = [Fruits]()
        for fruit in fruitList {
            defaultStock.append(Fruits(name: fruit, count: defaultCount))
        }
        print(defaultStock)
        return defaultStock
    }
    
    private func haveInStock(fruits: [Fruits]) -> Bool {
        for fruit in fruits {
            let stockCount = stock[fruit.fruitIndex].count
            let requestedCount = fruit.count
            if stockCount < requestedCount { return false }
        }
        return true
    }
    
    private func changeStock(_ fruit: Fruits) {
        stock[fruit.fruitIndex] = fruit
    }

    private func addStock(fruit: Fruits, isNegative: Bool = false) {
        let stockCount = stock[fruit.fruitIndex].count
        let requestedCount = fruit.count

        if isNegative {
            changeStock(Fruits(name: fruit.name, count: stockCount - requestedCount))
        } else {
            changeStock(Fruits(name: fruit.name, count: stockCount + requestedCount))
        }
    }
        
    func canSupplyRequest(_ fruits: [Fruits]) -> Bool {
        guard haveInStock(fruits: fruits) else {
            print("재고가 부족합니다.")
            return false
        }
        
        for fruit in fruits {
            addStock(fruit: fruit, isNegative: true)
        }
        return true
    }
}
