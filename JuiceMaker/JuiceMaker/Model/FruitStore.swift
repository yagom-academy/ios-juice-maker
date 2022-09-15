//  Created by som, LJ.
//  Copyright © yagom academy. All rights reserved.

import Foundation

class FruitStore {
    private var stock: [Fruit: Int] = [ : ] {
        didSet {
            NotificationCenter.default.post(name: NSNotification.Name("stockChanged"),
                                            object: nil,
                                            userInfo: ["stockChanged": stock])
        }
    }
    
    init(defaultStock: Int) {
            Fruit.allCases.forEach { stock[$0] = defaultStock }
    }
    
    func updateFruitStock() -> [Fruit: Int] {
        return stock
    }
    
    func checkEmptyStock(to fruit: Fruit) throws -> Int {
        guard let stock = stock[fruit] else {
            throw OrderError.emptyStock
        }
        return stock
    }
    
    func checkStockAmount(to stock: Int, with amountOfFruit: Int) -> Bool {
        guard stock >= amountOfFruit else {
            return false
        }
        return true
    }
    
    func checkStockBeforeUsed(to stock: Int, with amountOfFruit: Int) -> Bool {
        var resultOfFruitStock: [Bool] = []
        let value = checkStockAmount(to: stock, with: amountOfFruit)
        resultOfFruitStock.append(value)
        
        for value in resultOfFruitStock {
            if value == false {
                return false
            }
        }
        return true
    }
    
    func changeFruitStock(to stock: Int, to amountOfFruit: Int, of fruit: Fruit) {
        self.stock.updateValue(stock - amountOfFruit, forKey: fruit)
    }
}
