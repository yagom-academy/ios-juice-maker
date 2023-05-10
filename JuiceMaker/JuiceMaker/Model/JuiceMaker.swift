//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

enum Menu {
    case strawberryJuice
    case bananaJuice
    case pineappleJuice
    case strawberryAndBananaJuice
    case kiwiJuice
    case mangoJuice
    case mangoAndKiwiJuice
}

struct JuiceMaker {
    private let store: FruitStore
    
    init(fruitStore: FruitStore) {
        self.store = fruitStore
    }
    
    func orderJuice(menu: Menu) -> Bool {
        let isSuccess: Bool
        
        switch menu {
        case .strawberryJuice:
            isSuccess = makeBasicJuice(menu: .strawberry, count: 16)
        case .bananaJuice:
            isSuccess = makeBasicJuice(menu: .banana, count: 2)
        case .pineappleJuice:
            isSuccess = makeBasicJuice(menu: .pineapple, count: 2)
        case .strawberryAndBananaJuice:
            isSuccess = makeCollaborateJuice(main: (.strawberry, 10), sub: (.banana, 1))
        case .kiwiJuice:
            isSuccess = makeBasicJuice(menu: .kiwi, count: 3)
        case .mangoJuice:
            isSuccess = makeBasicJuice(menu: .mango, count: 3)
        case .mangoAndKiwiJuice:
            isSuccess = makeCollaborateJuice(main: (.mango, 2), sub: (.kiwi, 1))
        }
        
        return isSuccess
    }
    

}

// MARK: - Make Juice
extension JuiceMaker {
    private func makeBasicJuice(menu: Fruit, count: Int) -> Bool {
        guard store.verifyFruitCount(menu, count: count) else {
            return false
        }
        
        store.changeFruitCount(menu, count: count)
        return true
    }
    
    private func makeCollaborateJuice(main: (fruit: Fruit, count: Int), sub: (fruit: Fruit, count: Int)) -> Bool {
        guard store.verifyFruitCount(main.fruit, count: main.count),
              store.verifyFruitCount(sub.fruit, count: sub.count) else {
            return false
        }
        
        store.changeFruitCount(main.fruit, count: main.count)
        store.changeFruitCount(sub.fruit, count: sub.count)
        return true
    }
}
