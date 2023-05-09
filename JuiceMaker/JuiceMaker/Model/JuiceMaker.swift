//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

typealias Recipe = (fruit: FruitStore.Fruit, amount: Int)

// 쥬스 메이커 타입
struct JuiceMaker {
	
	enum FruitJuice: CaseIterable {
		case strawberryJuice
		case bananaJuice
		case kiwiJuice
		case pineappleJuice
		case strawberryBananaJuice
		case mangoJuice
		case mangoKiwiJuice
		
		var name: String {
			switch self {
			case .strawberryJuice:
				return "딸기쥬스"
			case .bananaJuice:
				return "바나나쥬스"
			case .kiwiJuice:
				return "키위쥬스"
			case .pineappleJuice:
				return "파인애플쥬스"
			case .strawberryBananaJuice:
				return "딸바쥬스"
			case .mangoJuice:
				return "망고쥬스"
			case .mangoKiwiJuice:
				return "망고키위쥬스"
			}
		}
		
		var juiceRecipe: Array<Recipe> {
			switch self {
			case .strawberryJuice:
				return [(fruit: FruitStore.Fruit.strawberry, amount: 16)]
			case .bananaJuice:
				return [(fruit: FruitStore.Fruit.banana, amount: 2)]
			case .kiwiJuice:
				return [(fruit: FruitStore.Fruit.kiwi, amount: 3)]
			case .pineappleJuice:
				return [(fruit: FruitStore.Fruit.pineapple, amount: 2)]
			case .strawberryBananaJuice:
				return [(fruit: FruitStore.Fruit.strawberry, amount: 10), (fruit: FruitStore.Fruit.banana, amount: 1)]
			case .mangoJuice:
				return [(fruit: FruitStore.Fruit.mango, amount: 3)]
			case .mangoKiwiJuice:
				return [(fruit: FruitStore.Fruit.mango, amount: 2), (fruit: FruitStore.Fruit.kiwi, amount: 1)]
			}
		}
	}
	
	var fruitStore: FruitStore
	
	init(fruitStore: FruitStore) {
		self.fruitStore = fruitStore
	}
	
	func makeFruitJuice(menu: FruitJuice) {
		let recipe = menu.juiceRecipe
        do {
            guard try fruitStore.isEnoughStock(recipe) else { return }
            try recipe.forEach { try fruitStore.changeStock(of: $0.fruit, minus: $0.amount) }
        } catch StockError.fruitNotFound {
            print(StockError.fruitNotFound.errorMessage)
        } catch StockError.outOfStock {
            print(StockError.outOfStock.errorMessage)
        } catch {
            print(StockError.unKnown.errorMessage)
        }
		print("\(menu.name) 제조가 완료되었습니다.")
	}
	
}
