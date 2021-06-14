//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum JuiceMenu {
	case strawberryJuice
	case bananaJuice
	case kiwiJuice
	case mangoJuice
	case pineappleJuice
	case strawNanaJuice
	case mangoKiwiJuice
	
	var recipe:[(Fruit, Int)] {
		switch self {
		case .strawberryJuice:
			return [(.strawberry, 16)]
		case .bananaJuice:
			return [(.banana, 2)]
		case .kiwiJuice:
			return [(.kiwi, 3)]
		case .mangoJuice:
			return [(.mango, 3)]
		case .pineappleJuice:
			return [(.pineapple, 2)]
		case .strawNanaJuice:
			return [(.strawberry, 10), (.banana, 1)]
		case .mangoKiwiJuice:
			return [(.mango, 2), (.kiwi, 1)]
		}
	}
}

enum Fruit: String, CaseIterable {
	case strawberry = "딸기"
	case banana = "바나나"
	case kiwi = "키위"
	case mango = "망고"
	case pineapple = "파인애플"
}

struct JuiceMaker {
	
	private var fruitStores =  [FruitStore]()
	
	init(){
		for fruit in Fruit.allCases {
			fruitStores.append(FruitStore(storeName: fruit))
		}
	}
	
	func checkJuiceMakable(recipes: [(Fruit, Int)]) -> Bool {
		
		let checkedRecipes = recipes.filter{ recipe in
			checkFruitAmountAbout(recipe: recipe)
		}
		
		return recipes.count == checkedRecipes.count
	}
	
	private func checkFruitAmountAbout(recipe: (name: Fruit, amount: Int)) -> Bool {
		
		let store = findFruitStore(fruitName: recipe.name)
		
		guard store.count != 0 else {
			return false
		}
		
		if recipe.amount <= store.count {
			return true
		} else {
			return false
		}
	}
	
	private func findFruitStore(fruitName: Fruit) -> [FruitStore] {
		
		let targetStore = fruitStores.filter{ store in store.name == fruitName }
		
		return targetStore
	}
}







