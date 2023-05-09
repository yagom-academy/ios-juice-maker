//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Menu {
    case strawberryJuice
    case bananaJuice
    case pineappleJuice
    case strawberryAndBananaJuice
    case kiwiJuice
    case mangoJuice
    case mangoAndKiwiJuice
}

// 쥬스 메이커 타입
struct JuiceMaker {
    private let store: FruitStore
    
    init(fruitStore: FruitStore) {
        self.store = fruitStore
    }
    
    func makeFruitJuice(menu: Menu) {
        switch menu {
        case .strawberryJuice:
            store.changeFruitCount(.strawberry, count: 16)
        case .bananaJuice:
            store.changeFruitCount(.banana, count: 2)
        case .pineappleJuice:
            store.changeFruitCount(.pineapple, count: 2)
        case .strawberryAndBananaJuice:
            store.changeFruitCount(.strawberry, count: 10)
            store.changeFruitCount(.banana, count: 2)
        case .kiwiJuice:
            store.changeFruitCount(.kiwi, count: 3)
        case .mangoJuice:
            store.changeFruitCount(.mango, count: 3)
        case .mangoAndKiwiJuice:
            store.changeFruitCount(.mango, count: 2)
            store.changeFruitCount(.kiwi, count: 1)
        }
    }
}
