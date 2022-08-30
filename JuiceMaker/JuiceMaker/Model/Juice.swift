//
//  Juice.swift
//  Created by Ash, 미니.
//

enum Juice: CaseIterable {
	case strawberryJuice
	case bananaJuice
	case kiwiJuice
	case pineappleJuice
	case mangoJuice
	case strawberrybananaJuice
	case mangokiwiJuice
	
	var needFruits: [Fruit] {
		switch self {
		case .strawberryJuice:
			return [.strawberry]
		case .bananaJuice:
			return [.banana]
		case .kiwiJuice:
			return [.kiwi]
		case .pineappleJuice:
			return [.pineapple]
		case .mangoJuice:
			return [.mango]
		case .strawberrybananaJuice:
			return [.strawberry, .banana]
		case .mangokiwiJuice:
			return [.mango, .kiwi]
		}
	}
	
	var needStocks: [Int] {
		switch self {
		case .strawberryJuice:
			return [-16]
		case .bananaJuice:
			return [-2]
		case .kiwiJuice:
			return [-3]
		case .pineappleJuice:
			return [-2]
		case .mangoJuice:
			return [-3]
		case .strawberrybananaJuice:
			return [-10, -1]
		case .mangokiwiJuice:
			return [-2, -1]
		}
	}
}
