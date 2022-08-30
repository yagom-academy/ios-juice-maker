//
//  JuiceMaker - FruitStore.swift
//  Created by Wonbi, woong
//
// 접근 하는 곳은 여러군데인데 참조하는 곳은 하나다.

class FruitStore {
    static var stockManager = FruitStore()
    var stock = Fruit.defaultStock
    
    private init() {
    }
    
    private func checkStock(fruit: Fruit, quantity: Int) -> Result<Int, StockError> {
        guard let stockQuantity = stock[fruit] else {
            return .failure(.invalidFruit)
        }
        guard stockQuantity >= quantity else {
            return .failure(.outOfStock)
        }
        return .success(quantity)
    }
    
    func changeStock(of fruit: Fruit, quantity: Int) {
        stock.updateValue(quantity, forKey: fruit)
    }
    
    func handOver(of fruit: Fruit, quantity: Int) -> Int {
        let result = checkStock(fruit: fruit, quantity: quantity)
        
        switch result {
        case .success(let neededQuantity):
            guard let stockQuantity = stock[fruit] else { return 0 }
            changeStock(of: fruit, quantity: stockQuantity - neededQuantity)
            return neededQuantity
        case .failure(.outOfStock):
            print(StockError.outOfStock.description)
            return 0
        case .failure(.invalidFruit):
            print(StockError.invalidFruit.description)
            return 0
        }
    }
}

