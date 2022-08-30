//
//  JuiceMaker - FruitStore.swift
//  Created by Wonbi, woong
//

class FruitStore {
    static var stockManager = FruitStore()
    var stock = Fruit.defaultStock
    
    private init() {
    }
    
    func checkStock(fruit: Fruit, amount: Int) -> Result<Int, StockError> {
        guard let fruitCount = stock[fruit] else {
            return .failure(.invalidFruit)
        }
        guard fruitCount > abs(amount) else {
            return .failure(.outOfStock)
        }
        return .success(amount)
    }
    
    func handOver(of fruit: Fruit, to amount: Int) -> Int {
        let result = checkStock(fruit: fruit, amount: amount)
        
        switch result {
        case .success(let changedAmount):
            guard let stockAmount = stock[fruit] else { return 0 }
            stock.updateValue(stockAmount + changedAmount, forKey: fruit)
            return changedAmount
        case .failure(.outOfStock):
            print(StockError.outOfStock.description)
            return 0
        case .failure(.invalidFruit):
            print(StockError.invalidFruit.description)
            return 0
        }
    }
}
