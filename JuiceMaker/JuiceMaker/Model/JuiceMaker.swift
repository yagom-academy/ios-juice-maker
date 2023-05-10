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
    
    typealias Recipe = [(Fruit, Int)]
    
    let strawberryJuiceRecipe: Recipe = [(.strawberry, 16)]
    let bananaJuiceRecipe: Recipe = [(.banana, 2)]
    let pineappleJuiceRecipe: Recipe = [(.pineapple, 2)]
    let kiwiJuiceRecipe: Recipe = [(.kiwi, 3)]
    let mangoJuiceRecipe: Recipe = [(.mango, 3)]
    let strawberryAndBananaJuice: Recipe = [(.strawberry, 10), (.banana, 1)]
    let mangoAndKiwiJuice: Recipe = [(.mango, 2), (.kiwi, 1)]
    
    func makeJuice(menu: Menu) -> Bool {
        let isSuccess: Bool
        
        switch menu {
        case .strawberryJuice:
            isSuccess = followRecipe(strawberryJuiceRecipe)
        case .bananaJuice:
            isSuccess = followRecipe(bananaJuiceRecipe)
        case .pineappleJuice:
            isSuccess = followRecipe(pineappleJuiceRecipe)
        case .kiwiJuice:
            isSuccess = followRecipe(kiwiJuiceRecipe)
        case .mangoJuice:
            isSuccess = followRecipe(mangoJuiceRecipe)
        case .strawberryAndBananaJuice:
            isSuccess = followRecipe(strawberryAndBananaJuice)
        case .mangoAndKiwiJuice:
            isSuccess = followRecipe(mangoAndKiwiJuice)
        }
        
        return isSuccess
    }
}

// MARK: - Make Juice
extension JuiceMaker {
    private func followRecipe(_ receipe: [(fruit: Fruit, count: Int)]) -> Bool {
        guard receipe.allSatisfy({ store.verifyFruitCount($0, count: $1) }) else { return false }

        receipe.forEach { store.changeFruitCount($0, count: $1) }
        return true
    }
}
