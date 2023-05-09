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
            makeJuice(menu: .strawberry, count: 16)
        case .bananaJuice:
            makeJuice(menu: .banana, count: 2)
        case .pineappleJuice:
            makeJuice(menu: .pineapple, count: 2)
        case .strawberryAndBananaJuice:
            makeCollaborateJuice(main: (.strawberry, 10), sub: (.banana, 1))
        case .kiwiJuice:
            makeJuice(menu: .kiwi, count: 3)
        case .mangoJuice:
            makeJuice(menu: .mango, count: 3)
        case .mangoAndKiwiJuice:
            makeCollaborateJuice(main: (.mango, 2), sub: (.kiwi, 1))
        }
    }
    
    func makeJuice(menu: Fruit, count: Int) {
        if store.verifyFruitCount(menu, count: count) {
            store.changeFruitCount(menu, count: count)
        }
    }
    
    func makeCollaborateJuice(main: (fruit: Fruit, count: Int), sub: (fruit: Fruit, count: Int)) {
        if store.verifyFruitCount(main.fruit, count: main.count) &&
            store.verifyFruitCount(sub.fruit, count: sub.count) {
            store.changeFruitCount(main.fruit, count: main.count)
            store.changeFruitCount(sub.fruit, count: sub.count)
        }
    }
}
