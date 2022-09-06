//
//  JuiceMaker - JuiceMaker.swift
//  Created by Ash, 미니.
//

// 쥬스 메이커 타입
struct JuiceMaker {
	private let shared = FruitStore.shared
	
	func makeJuice(juice: Juice) {
		do {
			try shared.haveStock(for: juice)
			print("\(juice) 완성되었습니다.")
		} catch StoreError.outOfStock {
			print("재고가 부족합니다.")
		} catch {
			print("알 수 없는 오류가 발생하였습니다.")
		}
	}
}
