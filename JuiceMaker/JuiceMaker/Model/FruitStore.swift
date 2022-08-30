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
            print(stockAmount)
            print(changedAmount)
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


//    func checkStock(fruit: Fruit, amount: Int) throws {
//        guard let fruitCount = stock[fruit] else {
//            throw StockError.invalidFruit
//        }
//        guard fruitCount > amount else {
//            throw StockError.outOfStock
//        }
//    }
//
//    func changeAmount(of fruit: Fruit, to amount: Int) {
//        do {
//            try checkStock(fruit: fruit, amount: amount)
//            guard let fruitCount = stock[fruit] else { return }
//            stock[fruit] = fruitCount + amount
//        } catch StockError.invalidFruit {
//            print(StockError.invalidFruit.description)
//            return
//        } catch StockError.outOfStock {
//            print(StockError.outOfStock.description)
//            return
//        } catch {
//            print("unknown Error! Error code: \(error)")
//        }
//    }
