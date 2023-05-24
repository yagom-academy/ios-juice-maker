//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

struct JuiceMaker {
    enum Menu: Int {
        case strawberryJuice
        case bananaJuice
        case pineappleJuice
        case kiwiJuice
        case mangoJuice
        case strawberryAndBananaJuice
        case mangoAndKiwiJuice
        
        var koreanName: String {
            switch self {
            case .strawberryJuice:
                return "딸기쥬스"
            case .bananaJuice:
                return "바나나쥬스"
            case .pineappleJuice:
                return "파인애플쥬스"
            case .kiwiJuice:
                return "키위쥬스"
            case .mangoJuice:
                return "망고쥬스"
            case .strawberryAndBananaJuice:
                return "딸바쥬스"
            case .mangoAndKiwiJuice:
                return "망키쥬스"
            }
        }
    }
    
    typealias Recipe = [(fruit: Fruit, amount: Int)]
    private let fruitStore: FruitStore
    private let recipe: [Menu: Recipe]
    
    init(_ fruitStore: FruitStore, _ recipe: [Menu: Recipe]) {
        self.fruitStore = fruitStore
        self.recipe = recipe
    }

    func makeJuice(menuNumber: Int) -> Menu? {
        guard let menu = Menu(rawValue: menuNumber),
              let recipe = provideRecipe(menu) else { return nil }
        
        guard canMakeJuice(recipe) else { return nil }
        
        consumeFruit(recipe)
        return menu
    }
    
    private func provideRecipe(_ menu: Menu) -> Recipe? {
        guard let juiceRecipe = recipe[menu] else { return nil }
        
        return juiceRecipe
    }
    
    
    private func canMakeJuice(_ recipe: Recipe) -> Bool {
        return recipe.allSatisfy { fruit, amount in return fruitStore.isEnoughFruits(fruit, count: amount) }
    }
    
    private func consumeFruit(_ recipe: Recipe) {
        recipe.forEach { fruit, amount in
            fruitStore.changeFruitCount(fruit, -amount)
        }
    }
}
