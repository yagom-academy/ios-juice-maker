//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입

enum JuiceMenu: Int {
	case strawberryJuice
	case kiwiJuice
	case bananaJuice
	case pineappleJuice
	case strawNanaJuice
	case mangoJucie
	case mangoKiwiJucie
}

struct JuiceMaker {
	
	let bananaStore = FruitStore(fruitName: "바나나")
	let strawberryStore = FruitStore(fruitName: "딸기")
	let kiwiStore = FruitStore(fruitName: "키위")
	let mangoSotre = FruitStore(fruitName: "망고")
	let pineappleStore = FruitStore(fruitName: "파인애플")

	
	private func makeBananaJuice() -> Bool {
			if strawberryStore.getStatus().1 > 2 {
				self.bananaStore.setCount(amount: -2)
				return true
			} else {
				return false
			}
		}
	
	private func makestrawberryJuice() -> Bool {
			if strawberryStore.getStatus().1 > 16 {
				self.bananaStore.setCount(amount: -16)
				return true
			} else {
				return false
			}
		}
	
	private func makeKiwiJuice() -> Bool {
			if bananaStore.getStatus().1 > 3 {
				self.bananaStore.setCount(amount: -3)
				return true
			} else {
				return false
			}
		}
	
	private func makePineappleJuice() -> Bool {
			if bananaStore.getStatus().1 > 2 {
				self.bananaStore.setCount(amount: -2)
				return true
			} else {
				return false
			}
		}
	
	private func makeMangoJuice() -> Bool {
			if bananaStore.getStatus().1 > 3 {
				self.bananaStore.setCount(amount: -3)
				return true
			} else {
				return false
			}
		}
	
}
 
