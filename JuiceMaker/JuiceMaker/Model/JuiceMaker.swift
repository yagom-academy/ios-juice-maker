//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum JuiceMenu: String {
	case strawberryJuice = "딸기쥬스"
	case bananaJuice = "바나나쥬스"
	case kiwiJuice = "키위쥬스"
	case mangoJuice = "망고쥬스"
	case pineappleJuice = "파인애플쥬스"
	case strawNanaJuice = "딸바쥬스"
	case mangoKiwiJuice = "망키쥬스"
	
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
	
	enum ErrorList: Error {
		case lackOfStock
	}
	
	var fruitStores = [FruitStore]()
	
	init(){
		for fruit in Fruit.allCases {
			fruitStores.append(FruitStore(storeName: fruit))
		}
	}
	
	func orderJuice(menu: JuiceMenu) throws -> Bool {
	
		try checkJuiceMakable(recipes: menu.recipe)
		
		menu.recipe.forEach{ (fruit, amount) in
			let targetStore = findFruitStore(fruitName: fruit)
			
			targetStore.setStock(amount: -amount)
		}
		
		return true
	}
	
	private func checkJuiceMakable(recipes: [(Fruit, Int)]) throws {
		let checkedRecipes = recipes.filter{ recipe in
			checkFruitAmountAbout(recipe: recipe)
		}
		
		guard recipes.count == checkedRecipes.count else {
			throw ErrorList.lackOfStock
		}
	}
	
	private func checkFruitAmountAbout(recipe: (name: Fruit, amount: Int)) -> Bool {
		
		let store = findFruitStore(fruitName: recipe.name)
		
		if recipe.amount <= store.stock {
			return true
		} else {
			return false
		}
	}
	
	private func findFruitStore(fruitName: Fruit) -> FruitStore {
		
		let targetStore = fruitStores.filter{ store in
			store.name == fruitName
		}
		
		return targetStore[0]
	}
}

