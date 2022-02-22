//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

struct JuiceMaker {
    private let fruitStore: FruitStore
    
    init(fruitStore: FruitStore) {
        self.fruitStore = fruitStore
    }
    
    func takeOrder(of juice: JuiceMenu) {
        do {
            try produce(juice: juice)
        } catch (let error) {
            JuiceMakerError.printOutput(of: error)
        }
    }
    
    private func produce(juice: JuiceMenu) throws {
        let recipe = findRecipe(of: juice)

        for (fruit, requiredAmount) in recipe {
            try fruitStore.consume(fruit: fruit, amount: requiredAmount)
        }
    }
    
    private func findRecipe(of juice: JuiceMenu) -> Constant.Recipe {
        switch juice {
        case .strawberry:
            return Constant.strawberryJuiceRecipe
        case .banana:
            return Constant.bananaJuiceRecipe
        case .kiwi:
            return Constant.kiwiJuiceRecipe
        case .pineapple:
            return Constant.pineappleJuiceRecipe
        case .strawberryBanana:
            return Constant.strawberryBananaJuiceRecipe
        case .mango:
            return Constant.mangoJuiceRecipe
        case .mangoKiwi:
            return Constant.mangoKiwiJuiceRecipe
        }
    }
}
