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
	static let fruitStore = FruitStore()
	
    private var fruitStocks = [Fruit: UInt]()
	
    private init(defaultStock: UInt = 10) {
        for fruit in Fruit.allCases {
            fruitStocks.updateValue(defaultStock, forKey: fruit)
        }
    }
	
    func lookUpStocks() -> [Fruit: UInt] {
        return fruitStocks
    }
    
	func add(fruit: Fruit, number: UInt) -> UInt {
		guard let quantity = fruitStocks[fruit] else {
			return 0
		}
		fruitStocks[fruit] = quantity + number
		return number
	}
	
	func consume(fruit: Fruit, number: UInt) -> UInt {
		guard let stock = fruitStocks[fruit], stock >= number else {
			return 0
		}
		fruitStocks[fruit] = stock - number
		return number
	}

	func hasEnoughFruitsStock(fruit: Fruit, number: UInt) -> Bool {
        guard let fruitStocks = fruitStocks[fruit] else { return false }
        return  fruitStocks > number
    }
}



