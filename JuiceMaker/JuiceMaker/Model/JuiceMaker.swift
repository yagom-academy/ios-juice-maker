//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
	enum JuiceMenu {
		case strawberryJuice
		case kiwiJuice
		case bananaJuice
		case pineappleJuice
		case strawNanaJuice
		case mangoJucie
		case mangoKiwiJucie
        
        var recipe : [(store: FruitList, amount: Int)] {
            switch self {
            case .strawberryJuice:
                return [(store: .strawberry, amount: 16)]
            case .mangoKiwiJucie:
                return [(store: .mango, amount: 2)]
            case .kiwiJuice:
                return [(store: .kiwi, amount: 3)]
            case .bananaJuice:
                return [(store: .banana, amount: 2)]
            case .pineappleJuice:
                return [(store: .pineapple, amount: 3)]
            case .strawNanaJuice:
                return [(store: .strawberry, amount: 10),
                        (store: .banana, amount:1)]
            case .mangoJucie:
                return [(store: .mango, amount: 16)]
            }
        }
	}

	enum FruitList: String {
		case strawberry = "딸기"
		case banana = "바나나"
		case kiwi = "키위"
		case mango = "망고"
		case pineapple = "파인애플"
	}
    
	private let bananaStore = FruitStore(fruitName: FruitList.banana.rawValue)
	private let strawberryStore = FruitStore(fruitName: FruitList.strawberry.rawValue)
	private let kiwiStore = FruitStore(fruitName: FruitList.kiwi.rawValue)
	private let mangoSotre = FruitStore(fruitName: FruitList.mango.rawValue)
	private let pineappleStore = FruitStore(fruitName: FruitList.pineapple.rawValue)
    
    private func makeJuice(targetStore store: FruitStore, amount number: Int) -> Bool {
        if store.status.count > number {
            store.setCount(amount: -number)
            return true
        } else {
            return false
        }
    }
    
    private func makeStrawNanaJuice() -> Bool {
		let strawberryLeftCount = strawberryStore.status.count
		let bananaLeftCount = bananaStore.status.count
        
        if strawberryLeftCount > 10, bananaLeftCount > 1 {
            strawberryStore.setCount(amount: -10)
            bananaStore.setCount(amount: -1)
            return true
        } else {
            return false
        }
    }
    
    private func makeMangoKiwiJucie() -> Bool {
		let mangoLeftCount = mangoSotre.status.count
		let kiwiLeftCount = kiwiStore.status.count
        
        if mangoLeftCount > 2, kiwiLeftCount > 1 {
            mangoSotre.setCount(amount: -2)
            kiwiStore.setCount(amount: -1)
            return true
        } else {
            return false
        }
    }
    
    public func makeJuice(menu type: JuiceMenu) -> Bool {
        var outcome: Bool
        
        switch type {
        case .strawberryJuice:
            outcome = makeJuice(targetStore: strawberryStore, amount: 16)
        case .bananaJuice:
            outcome = makeJuice(targetStore: bananaStore, amount: 2)
        case .kiwiJuice:
            outcome = makeJuice(targetStore: kiwiStore, amount: 3)
        case .pineappleJuice:
            outcome = makeJuice(targetStore: pineappleStore, amount: 3)
        case .mangoJucie:
            outcome = makeJuice(targetStore: mangoSotre, amount: 2)
        case .strawNanaJuice:
            outcome = makeStrawNanaJuice()
        case .mangoKiwiJucie:
            outcome = makeMangoKiwiJucie()
        }
        
        return outcome
    }
}

