//
//  JuiceMaker - JuiceMaker.swift
//  Created by Ash, 미니.
//

// 쥬스 메이커 타입
struct JuiceMaker {
	private let fruitStore: FruitStore
	
	init(store: FruitStore) {
		self.fruitStore = store
	}
	
	
	func makeJuice(juice: Juice) -> Bool {
		do {
			try fruitStore.haveStock(for: juice)
			return true
		} catch StoreError.outOfStock {
			return false
		} catch {
			return false
		}
	}
}
