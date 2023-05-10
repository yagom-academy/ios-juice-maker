//
//  JuiceMaker - JuiceMaker.swift
//  Created by Zion, Mint.
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
    
    func makeJuice(menu: Menu) -> Bool {
        let isSuccess: Bool
        
        switch menu {
        case .strawberryJuice:
            isSuccess = followReceipe([(.strawberry, 16)])
        case .bananaJuice:
            isSuccess = followReceipe([(.banana, 2)])
        case .pineappleJuice:
            isSuccess = followReceipe([(.pineapple, 2)])
        case .strawberryAndBananaJuice:
            isSuccess = followReceipe([(.strawberry, 10), (.banana, 1)])
        case .kiwiJuice:
            isSuccess = followReceipe([(.kiwi, 3)])
        case .mangoJuice:
            isSuccess = followReceipe([(.mango, 3)])
        case .mangoAndKiwiJuice:
            isSuccess = followReceipe([(.mango, 2), (.kiwi, 1)])
        }
        
        return isSuccess
    }
}

// MARK: - Make Juice
extension JuiceMaker {
    private func followReceipe(_ receipe: [(fruit: Fruit, count: Int)]) -> Bool {
        guard receipe.allSatisfy({ store.verifyFruitCount($0, count: $1) }) else { return false }

        receipe.forEach { store.changeFruitCount($0, count: $1) }
        return true
    }
}
