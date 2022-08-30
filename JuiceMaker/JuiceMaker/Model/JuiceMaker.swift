//
//  JuiceMaker - JuiceMaker.swift
//  Created by Ash, 미니.
// 

enum Juice {
	case strawberryJuice(Int)
	case bananaJuice(Int)
	case kiwiJuice(Int)
	case pineappleJuice(Int)
	case mangoJuice(Int)
	case strawberrybananaJuice(Int)
	case mangokiwiJuice(Int)
}

// 쥬스 메이커 타입
struct JuiceMaker {
	private let fruitStore: FruitStore = FruitStore()
}
