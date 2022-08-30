//
//  JuiceMaker - FruitStore.swift
//  Created by Ash, 미니.
//

// 과일 저장소 타입
class FruitStore {
	private var inventory: [Fruit: Int] = Fruit.beginningStock
	
	func haveStock(of fruits: [Fruit], over stocks: [Int]) throws {
		for (fruit, stock) in zip(fruits, stocks) {
			guard let remainingStock = inventory[fruit],
				  remainingStock >= -stock else {
				throw StoreError.outOfStock
			}
		}
	}
	
	func increaseStock(of fruits: [Fruit], by amounts: [Int]) {
		for (fruit, stock) in zip(fruits, amounts) {
			if let remainingStock = inventory[fruit] {
				inventory.updateValue(remainingStock + stock, forKey: fruit)
			}
		}
	}
}
