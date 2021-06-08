//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation


enum Recipe {
	case strawberryJuice(strawberryNeeded: Int = 16)
	case bananaJuice(bananaNeeded: Int = 2)
	case kiwiJuice(kiwiNeeded: Int = 3)
	case pineappleJuice(pineappleNeeded: Int = 2)
	case ddalbaJuice(strawberryNeeded: Int = 10, bananaNeeded: Int = 1)
	case mangoJuice(mangoNeeded: Int = 3)
	case mangoKiwiJuice(mangoNeeded: Int = 2, kiwiNeeded: Int = 1)
}

// 쥬스 메이커 타입 
struct JuiceMaker {
    var fruitStore: FruitStore
    
    init(fruitStore: FruitStore) {
        self.fruitStore = fruitStore
    }
    
    func makeJuice(recipe: Recipe)throws {
        switch recipe {
        case .strawberryJuice(let strawberryNeeded):
			guard fruitStore.hasEnoughFruitsStock(fruit: .strawberry, number: strawberryNeeded) else {
				print("재고 부족")
				return
			}
			fruitStore.consumeFruits(fruit: .strawberry, number: strawberryNeeded)
			
        case .bananaJuice(let bananaNeeded):
			guard fruitStore.hasEnoughFruitsStock(fruit: .banana, number: bananaNeeded) else {
				print("재고 부족")
				return
			}
			fruitStore.consumeFruits(fruit: .banana, number: bananaNeeded)
			
        case .kiwiJuice(let kiwiNeeded):
			guard fruitStore.hasEnoughFruitsStock(fruit: .kiwi, number: kiwiNeeded) else {
				print("재고 부족")
				return
			}
			fruitStore.consumeFruits(fruit: .kiwi, number: kiwiNeeded)
			
        case .pineappleJuice(let pineappleNeeded):
			guard fruitStore.hasEnoughFruitsStock(fruit: .pineapple, number: pineappleNeeded) else {
				print("재고 부족")
				return
			}
			fruitStore.consumeFruits(fruit: .pineapple, number: pineappleNeeded)
			
        case .ddalbaJuice(let strawberryNeeded, let bananaNeeded):
            guard fruitStore.hasEnoughFruitsStock(fruit: .strawberry, number: strawberryNeeded),
				  fruitStore.hasEnoughFruitsStock(fruit: .banana, number: bananaNeeded) else {
				print("재고 부족")
				return
			}
			fruitStore.consumeFruits(fruit: .strawberry, number: strawberryNeeded)
			fruitStore.consumeFruits(fruit: .banana, number: bananaNeeded)
			
        case .mangoJuice(let mangoNeeded):
			guard fruitStore.hasEnoughFruitsStock(fruit: .mango, number: mangoNeeded) else {
				print("재고 부족")
				return
			}
			fruitStore.consumeFruits(fruit: .mango, number: mangoNeeded)
			
        case .mangoKiwiJuice(let mangoNeeded, let kiwiNeeded):
            guard fruitStore.hasEnoughFruitsStock(fruit: .mango, number: mangoNeeded),
				  fruitStore.hasEnoughFruitsStock(fruit: .kiwi, number: kiwiNeeded) else {
				print("재고 부족")
				return
			}
			fruitStore.consumeFruits(fruit: .mango, number: mangoNeeded)
			fruitStore.consumeFruits(fruit: .kiwi, number: kiwiNeeded)
		}
    }
    
}




