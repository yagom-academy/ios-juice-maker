//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
	enum Fruit: CaseIterable {
		case strawberry
		case banana
		case pineapple
		case kiwi
		case mango
	}
	
	private var inventory: Dictionary<Fruit, Int> = Fruit.allCases
        .reduce(into: Dictionary<Fruit, Int>()) { $0[$1] = 10 }
	
    func calculateStock(for fruit: Fruit, quantity: Int) throws -> Int {
        guard let fruitStock = inventory[fruit] else { throw StockError.fruitNotFound }
        guard fruitStock > quantity else { throw StockError.outOfStock }
        
        return fruitStock - quantity
    }
    
	func changeStock(of fruit: Fruit, quantity: Int) {
        guard let _ = inventory[fruit] else { return }
		inventory[fruit] = quantity
	}
}
