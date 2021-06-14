//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

// 과일 타입

enum Fruit: CaseIterable {
	case strawberry
	case banana
	case pineapple
	case kiwi
	case mango
}
	
class FruitStore {
    
	static let shared = FruitStore()
    private(set) var fruitStocks = [Fruit: UInt]()
	
    private init(defaultStock: UInt = 10) {
        for fruit in Fruit.allCases {
            fruitStocks.updateValue(defaultStock, forKey: fruit)
        }
    }
    
	func add(fruit: Fruit, number: UInt) {
		guard let quantity = fruitStocks[fruit] else {
			return
		}
		fruitStocks[fruit] = quantity + number
	}
	
	func consume(fruit: Fruit, number: UInt) {
		guard hasEnoughFruitsStock(fruit: fruit, number: number), let stock = fruitStocks[fruit] else {
			return
		}
		fruitStocks[fruit] = stock - number
	}

	func hasEnoughFruitsStock(fruit: Fruit, number: UInt) -> Bool {
        guard let fruitStocks = fruitStocks[fruit] else { return false }
        return  fruitStocks >= number
    }
}



