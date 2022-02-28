//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

struct JuiceMaker {
    enum Menu: String {
        case strawberry = "딸기"
        case banana = "바나나"
        case kiwi = "키위"
        case pineapple = "파인애플"
        case strawberryBanana = "딸바"
        case mango = "망고"
        case mangoKiwi = "망키"
    }
    
    private let fruitStore: FruitStore
    
    init(fruitStore: FruitStore) {
        self.fruitStore = fruitStore
    }
    
    func produce(juice: Menu) throws {
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
