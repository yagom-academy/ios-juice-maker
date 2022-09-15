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
    
    func checkStockAmount(to stock: Int, with amountOfFruit: Int) throws {
        guard stock >= amountOfFruit else {
            throw OrderError.outOfStock
        }
    }
    
    func changeFruitStock(to amountOfFruit: Int, of fruit: Fruit) {
        guard let stock = stock[fruit] else {
            return
        }
        
        self.stock.updateValue(stock - amountOfFruit, forKey: fruit)
    }
}
