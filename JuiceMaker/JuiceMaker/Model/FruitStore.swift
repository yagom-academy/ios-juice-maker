//  Created by som, LJ.
//  Copyright © yagom academy. All rights reserved.

import Foundation

class FruitStore {
    private var stock: [Fruit: Int] = [
        .strawberry: 10,
        .banana: 10,
        .pineapple: 10,
        .mango: 10,
        .kiwi: 10
    ]
    
    func checkStockBeUsed(in juice: Juice) throws {
        for (fruit, amountOfFruit) in juice.recipeOfJuice {
            guard let stock = stock[fruit], stock != 0 else {
                throw OrderError.emptyStock
            }
            guard stock >= amountOfFruit else {
                throw OrderError.outOfStock
            }
        }
    }
    
    func changeFruitStock(to juice: Juice) {
        for (fruit, amountOfFruit) in juice.recipeOfJuice {
            if let stock = stock[fruit] {
                self.stock.updateValue(stock - amountOfFruit, forKey: fruit)
            }
        }
    }
}
