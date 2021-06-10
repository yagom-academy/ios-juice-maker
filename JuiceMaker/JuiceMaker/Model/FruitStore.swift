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
    
    var fruitStocks = [Fruit: Int]()
    init(defaultStock: Int = 10, fruit: Fruit) {
        for fruit in Fruit.allCases {
            fruitStocks.updateValue(defaultStock, forKey: fruit)
        }
    }
  
	func add(fruit: Fruit, number: Int) {
        fruitStocks[fruit]? += number
	}

	func consume(fruit:Fruit, number:Int){
		fruitStocks[fruit]? -= number
	}

    func hasEnoughFruitsStock(fruit: Fruit, number: Int) -> Bool {
        guard let fruitStocks = fruitStocks[fruit] else { return false }
        return  fruitStocks > number
    }
    
}



