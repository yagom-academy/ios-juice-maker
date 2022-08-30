//
//  JuiceMaker - FruitStore.swift
//  Created by Ash, 미니.
//

enum Fruit {
	case strawberry
	case banana
	case pineapple
	case kiwi
	case mango
}

// 과일 저장소 타입
class FruitStore {
	private let fruitStock: [Fruit: Int] =
	[.strawberry: 10, .banana: 10, .pineapple: 10, .kiwi: 10, .mango: 10]
}
