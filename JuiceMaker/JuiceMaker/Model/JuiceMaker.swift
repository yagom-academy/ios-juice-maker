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
    
    private func makeBananaJuice() -> Bool {
        if bananaStore.status.count > 2 {
            bananaStore.setCount(amount: -2)
            return true
        } else {
            return false
        }
    }
    
    private func makeStrawberryJuice() -> Bool {
		if strawberryStore.status.count > 16 {
            strawberryStore.setCount(amount: -16)
            return true
        } else {
            return false
        }
    }
    
    private func makeKiwiJuice() -> Bool {
		if kiwiStore.status.count > 3 {
            kiwiStore.setCount(amount: -3)
            return true
        } else {
            return false
        }
    }
    
    private func makePineappleJuice() -> Bool {
		if pineappleStore.status.count > 2 {
            pineappleStore.setCount(amount: -2)
            return true
        } else {
            return false
        }
    }
    
    private func makeMangoJuice() -> Bool {
		if mangoSotre.status.count > 3 {
            mangoSotre.setCount(amount: -3)
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
            outcome = makeStrawberryJuice()
        case .bananaJuice:
            outcome = makeBananaJuice()
        case .kiwiJuice:
            outcome = makeKiwiJuice()
        case .pineappleJuice:
            outcome = makePineappleJuice()
        case .mangoJucie:
            outcome = makeMangoJuice()
        case .strawNanaJuice:
            outcome = makeStrawNanaJuice()
        case .mangoKiwiJucie:
            outcome = makeMangoKiwiJucie()
        }
        
        return outcome
    }
}

