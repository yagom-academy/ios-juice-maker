//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

// 과일 타입

enum Fruit {
	case strawberry
	case banana
	case pineapple
	case kiwi
	case mango
}
	
class FruitStore {
	var strawberryStock: Int
	var bananaStock: Int
	var pineappleStock: Int
	var kiwiStock: Int
	var mangoStock: Int
	
	func addFruits(fruit:Fruit, number:Int){
		switch fruit {
		case .strawberry:
			self.strawberryStock += number
		case .banana:
			self.bananaStock += number
		case .pineapple:
			self.pineappleStock += number
		case .kiwi:
			self.kiwiStock += number
		case .mango:
			self.mangoStock += number
		}
	}
	
	func consumeFruits(fruit:Fruit, number:Int){
		switch fruit {
		case .strawberry:
			self.strawberryStock -= number
		case .banana:
			self.bananaStock -= number
		case .pineapple:
			self.pineappleStock -= number
		case .kiwi:
			self.kiwiStock -= number
		case .mango:
			self.mangoStock -= number
		}
	}
    
    func hasEnoughFruitsStock(fruit: Fruit, number: Int) -> Bool {
        switch fruit {
        case .strawberry:
            return self.strawberryStock >= number
        case .banana:
            return self.bananaStock >= number
        case .pineapple:
            return self.pineappleStock >= number
        case .kiwi:
            return self.kiwiStock >= number
        case .mango:
            return self.mangoStock >= number
        }
    }
    
	init(defaultStock:Int = 10) {
		self.strawberryStock = defaultStock
		self.bananaStock = defaultStock
		self.pineappleStock = defaultStock
		self.kiwiStock = defaultStock
		self.mangoStock = defaultStock
	}
}
