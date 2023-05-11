//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

struct JuiceMaker {
    enum Menu {
        case strawberryJuice
        case bananaJuice
        case pineappleJuice
        case kiwiJuice
        case mangoJuice
        case strawberryAndBananaJuice
        case mangoAndKiwiJuice
    }
    
    typealias Recipe = [(fruit: Fruit, amount: Int)]
    private let store: FruitStore
    
    init(fruitStore: FruitStore) {
        self.store = fruitStore
    }

    private func provideRecipe(_ menu: Menu) -> Recipe {
        switch menu {
            case .strawberryJuice:
                return [(.strawberry, 16)]
            case .bananaJuice:
                return [(.banana, 2)]
            case .pineappleJuice:
                return [(.pineapple, 2)]
            case .kiwiJuice:
                return [(.kiwi, 3)]
            case .mangoJuice:
                return [(.mango, 3)]
            case .strawberryAndBananaJuice:
                return [(.strawberry, 10), (.banana, 1)]
            case .mangoAndKiwiJuice:
                return [(.mango, 2), (.kiwi, 1)]
        }
    }
    
    func canMakeJuice(menu: Menu) -> Bool {
        let recipe = provideRecipe(menu)
        
        guard recipe.allSatisfy({ store.isEnoughFruits($0, count: $1) }) else { return false }

        recipe.forEach { store.changeFruitCount($0, count: $1) }
        return true
    }
}
