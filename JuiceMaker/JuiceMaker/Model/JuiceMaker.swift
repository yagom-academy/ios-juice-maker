//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

protocol JuiceMakeDelegate {
    func successJuiceMake()
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
    }
    
    typealias Recipe = [(fruit: Fruit, amount: Int)]
    private let store: FruitStore
    var delegate: JuiceMakeDelegate?
    
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
    
    func makeJuice(menu: Menu) {
        let recipe = provideRecipe(menu)
        
        guard canMakeJuice(recipe) else {
            delegate?.failJuiceMake()
            return
        }
        
        consumeFruit(recipe)
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
        
        delegate?.successJuiceMake()
    }
}
