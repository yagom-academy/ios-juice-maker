//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

enum Fruit: Int, CaseIterable {
    case strawberry = 0
	case banana = 1
	case kiwi = 2
    case pineapple = 3
	case mango = 4
}
	
class FruitStore {
    
	static let shared = FruitStore()
	
    private(set) var fruitStocks = [Fruit: UInt]()
	
    private init(defaultStock: UInt = 10) {
        for fruit in Fruit.allCases {
            fruitStocks.updateValue(defaultStock, forKey: fruit)
        }
    }
}

extension FruitStore {
    
    //MARK:- Internal Functions
    
    func add(fruit: Fruit, number: UInt) {
        guard let quantity = fruitStocks[fruit] else {
            return
        }
        fruitStocks[fruit] = quantity + numbe
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



