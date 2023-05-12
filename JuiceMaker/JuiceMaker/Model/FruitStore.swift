//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//  last modified by maxhyunm, kobe
//

class FruitStore {
    private var inventory: [Fruit: Int] = [:]
    
    init(stock: [Fruit: Int]) {
        self.inventory = stock
    }
    
    init(equalizedStock: Int) {
        self.inventory = Fruit.allCases.reduce(into: [:]) {
            $0[$1] = equalizedStock
        }
    }
	
	func getInventoryStatus() -> [Fruit: Int] {
		return self.inventory
	}
	
    func calculateStock(of fruit: Fruit, quantity: Int) throws -> Int {
        guard let fruitStock = inventory[fruit] else {
            throw StockError.fruitNotFound
        }
        guard fruitStock >= quantity else {
            throw StockError.outOfStock
        }
        
        return fruitStock - quantity
    }
    
	func changeStock(of fruit: Fruit, quantity: Int) {
        guard let _ = inventory[fruit] else { return }
		inventory[fruit] = quantity
	}
}
