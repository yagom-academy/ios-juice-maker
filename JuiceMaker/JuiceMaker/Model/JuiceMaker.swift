//
//  JuiceMaker - JuiceMaker.swift
//  Created by Ash, 미니.
// 

enum Juice {
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

// 쥬스 메이커 타입
struct JuiceMaker {
    private let fruitStore: FruitStore = FruitStore()
    
    func makeJuice(juice: Juice) {
        let juiceNeedFruits = juice.needFruits
        let juiceNeedStocks = juice.needStocks
        
        do {
            try fruitStore.checkStock(for: juiceNeedFruits, than: juiceNeedStocks)
            fruitStore.changeStock(for: juiceNeedFruits, than: juiceNeedStocks)
        } catch StockError.outOfStock {
            print("재고가 부족합니다.")
        } catch {
            print("알 수 없는 오류가 발생하였습니다.")
        }
    }
}
