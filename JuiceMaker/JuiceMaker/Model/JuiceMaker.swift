//
//  JuiceMaker - JuiceMaker.swift
//  Created by Ash, 미니.
// 

enum Juice {
    case strawberryJuice(strawberry: Int)
    case bananaJuice(banana: Int)
    case kiwiJuice(kiwi: Int)
    case pineappleJuice(pineapple: Int)
    case mangoJuice(mango: Int)
    case strawberrybananaJuice(strawberry: Int, banana: Int)
    case mangokiwiJuice(mango: Int, kiwi: Int)
}

// 쥬스 메이커 타입
struct JuiceMaker {
    private let userJuice = Juice.mangokiwiJuice(mango: 2, kiwi: 1)
	private let fruitStore: FruitStore = FruitStore()
}
