//  Created by som, LJ.
//  Copyright © yagom academy. All rights reserved.

import Foundation

class FruitStore {
    private var stock: [Fruit: Int] = [:]
    
    init(defaultStock: Int) {
        Fruit.allCases.forEach { stock[$0] = defaultStock }
    }
    
    func changeFruitStock(fruit: Fruit, amount: Int) throws {
        guard let countFruit = stock[fruit] else {
            throw OrderError.emptyStock
        }
        
        if countFruit - amount < 0 {
            throw OrderError.outOfStock
        }
        
        stock[fruit] = countFruit - amount
    }
}
