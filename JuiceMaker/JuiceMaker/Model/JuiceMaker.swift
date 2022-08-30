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
}

// 쥬스 메이커 타입
struct JuiceMaker {
	private let fruitStore: FruitStore = FruitStore()
    
    func makeJuice(juice: Juice) {
        switch juice {
        case .strawberryJuice:
            if fruitStore.checkStock(fruit: .strawberry, stock: -16) {
                fruitStore.changeStock(fruits: .strawberry, stocks: -16)
            }
        case .bananaJuice:
            if fruitStore.checkStock(fruit: .banana, stock: -2) {
                fruitStore.changeStock(fruits: .banana, stocks: -2)
            }
        case .kiwiJuice:
            if fruitStore.checkStock(fruit: .kiwi, stock: -3) {
                fruitStore.changeStock(fruits: .kiwi, stocks: -3)
            }
        case .pineappleJuice:
            if fruitStore.checkStock(fruit: .pineapple, stock: -2) {
                fruitStore.changeStock(fruits: .pineapple, stocks: -2)
            }
        case .mangoJuice:
            if fruitStore.checkStock(fruit: .mango, stock: -3) {
                fruitStore.changeStock(fruits: .mango, stocks: -3)
            }
        case .strawberrybananaJuice:
            if fruitStore.checkStock(fruit: .strawberry, stock: -10) &&
                fruitStore.checkStock(fruit: .banana, stock: -1) {
                fruitStore.changeStock(fruits: .strawberry, .banana, stocks: -10, -1)
            }
        case .mangokiwiJuice:
            if fruitStore.checkStock(fruit: .mango, stock: -2) &&
                fruitStore.checkStock(fruit: .kiwi, stock: -1) {
                fruitStore.changeStock(fruits: .mango, .kiwi, stocks: -2, -1)
            }
        }
    }
}
