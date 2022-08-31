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
    private var stock: [Fruits] {
        var stock = [Fruits]()
        for fruit in Fruits.FruitName.fruitsList {
            stock.insert(Fruits(name: fruit, count: 10), at: fruit.rawValue)
        }
        return stock
    }
    
    private init() {}
    
    private func haveInStock(fruits: [Fruits]) -> Bool {
        for fruit in fruits {
            let stockCount = stock[fruit.name.rawValue].count
            let requestedCount = fruit.count
            if stockCount < requestedCount { return false }
        }
        return true
    }
    
    func changeStock(of fruit: Fruit, number: Int) {
        stock.updateValue(number, forKey: fruit)
    }
    
    func addStock(of fruit: Fruit, number: Int) {
        guard let numberOfStock = stock[fruit] else { return }
        changeStock(of: fruit, number: numberOfStock + number)
    }
    
    func removeStock(of fruit: Fruit, number: Int) {
        guard let numberOfStock = stock[fruit] else { return }
        changeStock(of: fruit, number: numberOfStock - number)
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
