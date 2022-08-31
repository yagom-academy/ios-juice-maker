//
//  JuiceMaker - FruitStore.swift
//  Created by Wonbi, woong
//

class FruitStore {
    static var stockManager = FruitStore()
    var stock: [Fruits]
    
    private init() {
        for fruit in Fruits.FruitName.fruitsList {
            stock.append(Fruits(name: fruit, count: 10))
        }
    }
    
    private func checkStock(fruit: Fruit, number: Int) -> Result<Void, StockError> {
        guard let stockQuantity = stock[fruit] else {
            return .failure(.invalidFruit)
        }
        guard stockQuantity >= number else {
            return .failure(.outOfStock)
        }
        return .success(())
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
