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
	
	var needFruitAndStock: [Fruit: Int] {
		switch self {
		case .strawberryJuice:
			return [.strawberry: -16]
		case .bananaJuice:
			return [.banana: -2]
		case .kiwiJuice:
			return [.kiwi: -3]
		case .pineappleJuice:
			return [.pineapple: -2]
		case .mangoJuice:
			return [.mango: -3]
		case .strawberrybananaJuice:
			return [.strawberry: -10, .banana: -1]
		case .mangokiwiJuice:
			return [.mango: -2, .kiwi: -1]
		}
	}
}
