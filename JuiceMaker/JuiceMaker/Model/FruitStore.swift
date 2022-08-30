//
//  JuiceMaker - FruitStore.swift
//  Created by Wonbi, woong
//

class FruitStore {
    static var stockManager = FruitStore()
    var stock: [Fruit:Int]
    
    private init() {
        var stock = [Fruit:Int]()
        for fruit in Fruit.allCases {
            stock[fruit] = 10
        }
        self.stock = stock
    }
    
    func changeAmount(of fruit: Fruit, to amount: Int) {
        guard let fruitCount = stock[fruit] else { return }
        stock[fruit] = fruitCount + amount
    }
    
    func handOver(fruit: Fruit, amount: Int) -> Result<Int, StockError> {
        guard let fruitCount = stock[fruit] else {
            return .failure(.invalidFruit)
        }
        guard fruitCount > amount else {
            return .failure(.outOfStock)
        }
        changeAmount(of: fruit, to: -amount)
        return .success(fruitCount)
    }
        
}
