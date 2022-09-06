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
    
    func checkStockBeUsed(in juice: Juice) throws {
        for (fruit, amountOfFruit) in juice.recipeOfJuice {
            guard let stock = stock[fruit] else {
                throw OrderError.emptyStock
            }
            guard stock - amountOfFruit >= 0 else {
                throw OrderError.outOfStock
            }
        }
    }
    
    func changeFruitStock(to juice: Juice) {
        for (fruit, amountOfFruit) in juice.recipeOfJuice {
            if let stock = self.stock[fruit] {
                self.stock.updateValue(stock - amountOfFruit, forKey: fruit)
            }
        }
    }
}
