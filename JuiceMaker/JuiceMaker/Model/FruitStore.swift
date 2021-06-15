//
//  JuiceMaker - FruitStore.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
//

import Foundation

class FruitStore {
	private var count = 10
	
	var stock: Int {
		get {
			return count
		}
	}
	
	let name: Fruit
	
	init(storeName: Fruit){
		self.name = storeName
	}
	
	func setStock(amount number: Int){
		count += number
	}
}

