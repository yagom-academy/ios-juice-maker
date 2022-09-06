//
//  JuiceMaker - FruitStore.swift
//  Created by Ash, 미니.
//

// 과일 저장소 타입
final class FruitStore {
	static var shared = FruitStore()
	var inventory: [Fruit: Int] = Fruit.beginningStock
	
	func haveStock(for juice: Juice) throws {
		let needFruitAndStock = juice.needFruitAndStock
		
		for (fruit, stock) in needFruitAndStock {
			guard let remainingStock = inventory[fruit],
				  remainingStock >= -stock else {
				throw StoreError.outOfStock
			}
		}
		changeStock(fruitAndStock: needFruitAndStock)
	}
	
	private func changeStock(fruitAndStock: [Fruit: Int]) {
		for (fruit, stock) in fruitAndStock {
			if let remainingStock = inventory[fruit] {
				inventory.updateValue(remainingStock + stock, forKey: fruit)
			}
		}
	}
}
