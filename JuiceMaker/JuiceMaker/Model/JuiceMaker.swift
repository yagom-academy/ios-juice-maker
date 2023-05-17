//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

protocol JuiceMakeDelegate {
    func successJuiceMake(_ menu: JuiceMaker.Menu)
    func failJuiceMake()
    func changeFruitStock(fruit: Fruit, amount: String)
}

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
    private let store: FruitStore
    var delegate: JuiceMakeDelegate?
    var recipe: [Menu: Recipe]
    
    init(_ fruitStore: FruitStore, _ recipe: [Menu: Recipe]) {
        self.store = fruitStore
        self.recipe = recipe
    }

    private func provideRecipe(_ menu: Menu) -> Recipe? {
        guard let juiceRecipe = recipe[menu] else { return nil }
        
        return juiceRecipe
    }
    
    func makeJuice(menu: Menu) {
        guard let recipe = provideRecipe(menu) else { return }
        
        guard canMakeJuice(recipe) else {
            delegate?.failJuiceMake()
            return
        }
        
        consumeFruit(recipe)
        delegate?.successJuiceMake(menu)
    }
    
    private func canMakeJuice(_ recipe: Recipe ) -> Bool {
        guard recipe.allSatisfy({ fruit, amount in return store.isEnoughFruits(fruit, count: amount) }) else { return false }
        
        return true
    }
    
    private func consumeFruit(_ recipe: Recipe) {
        recipe.forEach { fruit, amount in
            let leftFruitStock = store.provideFruitStock(fruit) - amount
            
            delegate?.changeFruitStock(fruit: fruit, amount: String(leftFruitStock))
            store.changeFruitCount(fruit, count: amount)
        }
    }
}
