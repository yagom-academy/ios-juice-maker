//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

struct JuiceMaker {
    enum Menu {
        case strawberry
        case banana
        case kiwi
        case pineapple
        case strawberryBanana
        case mango
        case mangoKiwi
    }
    
    let fruitStore: FruitStore = FruitStore()
    
    func takeOrder(of juice: Menu) {
        do {
            try produce(juice: juice)
        } catch (let error) {
            JuiceMakerError.printOutput(of: error)
        }
    }
    
    private func produce(juice: Menu) throws {
        let recipe = findRecipe(of: juice)

        try fruitStore.checkEnoughStocks(recipe: recipe)
        
        for (fruit, requiredAmount) in recipe {
            try fruitStore.consume(fruit: fruit, amount: requiredAmount)
        }
    }
    
    private func findRecipe(of juice: Menu) -> Constant.CustomType.Recipe {
        switch juice {
        case .strawberry:
            return Constant.Recipes.strawberryJuice
        case .banana:
            return Constant.Recipes.bananaJuice
        case .kiwi:
            return Constant.Recipes.kiwiJuice
        case .pineapple:
            return Constant.Recipes.pineappleJuice
        case .strawberryBanana:
            return Constant.Recipes.strawberryBananaJuice
        case .mango:
            return Constant.Recipes.mangoJuice
        case .mangoKiwi:
            return Constant.Recipes.mangoKiwiJuice
        }
    }
}
