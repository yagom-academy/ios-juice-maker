//
//  FruitJuice.swift
//  JuiceMaker
//
//  Created by Minseong Kang on 2023/05/10.
//

enum FruitJuice {
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
			return [(fruit: .strawberry, quantity: 16)]
		case .bananaJuice:
			return [(fruit: .banana, quantity: 2)]
		case .kiwiJuice:
			return [(fruit: .kiwi, quantity: 3)]
		case .pineappleJuice:
			return [(fruit: .pineapple, quantity: 2)]
		case .strawberryBananaJuice:
			return [(fruit: .strawberry, quantity: 10), (fruit: .banana, quantity: 1)]
		case .mangoJuice:
			return [(fruit: .mango, quantity: 3)]
		case .mangoKiwiJuice:
			return [(fruit: .mango, quantity: 2), (fruit: .kiwi, quantity: 1)]
		}
	}
}
