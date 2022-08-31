//
//  JuiceMaker - FruitStore.swift
//  Created by Wonbi, woong
//

class FruitStore {
    enum StockManagement {
        case haveInStock
        case outOfStock
    }
    
    static var stockManager = FruitStore()
    private var stock: [Fruits]
    
    private init() {
        for fruit in Fruits.FruitName.fruitsList {
            stock.insert(Fruits(name: fruit, count: 10), at: fruit.rawValue)
        }
    }
    
    private func haveInStock(fruits: [Fruits]) -> Bool {
        for fruit in fruits {
            let stockCount = stock[fruit.name.rawValue].count
            let requestedCount = fruit.count
            if stockCount < requestedCount { return false }
        }
        return true
    }
    
    func changeStock(fruit: Fruits) {
        stock.insert(fruit, at: fruit.name.rawValue)
    }
    
    func addStock(fruits: [Fruits]) {
        for fruit in fruits {
            let stockCount = stock[fruit.name.rawValue].count
            let requestedCount = fruit.count
            changeStock(fruit: Fruits(name: fruit.name, count: stockCount + requestedCount))
        }
    }
    
    func removeStock(fruits: [Fruits]) {
        for fruit in fruits {
            let stockCount = stock[fruit.name.rawValue].count
            let requestedCount = fruit.count
            changeStock(fruit: Fruits(name: fruit.name, count: stockCount - requestedCount))
        }
    }
    
    func handOver(of fruit: Fruit, number: Int) -> Int {
        let result = checkStock(fruit: fruit, number: number)
        
        switch result {
        case .success(_):
            removeStock(of: fruit, number: number)
            return number
        case .failure(.outOfStock):
            print(StockError.outOfStock.description)
            return 0
        case .failure(.invalidFruit):
            print(StockError.invalidFruit.description)
            return 0
        }
    }
}
