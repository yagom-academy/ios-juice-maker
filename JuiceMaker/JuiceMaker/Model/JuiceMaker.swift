//
//  JuiceMaker - JuiceMaker.swift
//  Created by uemu, Toy.
//  Copyright © yagom academy. All rights reserved.
//

// 쥬스 메이커 타입
struct JuiceMaker {
    private let fruitStore = FruitStore.singleTon
    
    private func manufacturefruitJuice(in fruitJuice: FruitJuice) {
        switch fruitJuice {
        case .strawberryJuice:
            fruitStore.branchHandler(fruit: .strawberry, number: 16)
        case .bananaJuice:
            fruitStore.branchHandler(fruit: .banana, number: 2)
        case .kiwiJuice:
            fruitStore.branchHandler(fruit: .kiwi, number: 3)
        case .pineappleJuice:
            fruitStore.branchHandler(fruit: .pineapple, number: 2)
        case .mangoJuice:
            fruitStore.branchHandler(fruit: .mango, number: 3)
        }
    }
    
    private func manufactureMixFruitJuice(in mixFruitJuice: MixFruitJuice) {
        switch mixFruitJuice {
        case .strawberryBananaJuice:
            fruitStore.branchHandler(fruit: .strawberry, number: 10)
            fruitStore.branchHandler(fruit: .banana, number: 1)
        case .mangoKiwiJuice:
            fruitStore.branchHandler(fruit: .mango, number: 2)
            fruitStore.branchHandler(fruit: .kiwi, number: 1)
        }
    }
}
