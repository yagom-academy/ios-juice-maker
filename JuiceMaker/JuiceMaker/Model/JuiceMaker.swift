//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//  last modified by Yetti, yy-ss99, Mary.

struct JuiceMaker {
    let fruitStore: FruitStore
    
    func takeOrder(_ juiceType: Juice) {
        let recipe = juiceType.giveRecipe()
        let check = checkFruitStock(recipe)
        
        switch check {
        case .success:
            makeJuice(with: recipe)
            print("\(juiceType)가(이) 준비되었습니다.")
        case .failure(let error):
            print(error)
        }
    }
    
    private func checkFruitStock(_ recipe: [FruitNameAndAmount]) -> Result<Bool, BuyError> {
        for ingredient in recipe {
            guard let stock = fruitStore.fruitStock[ingredient.name] else { return .failure(BuyError.unknown) }
            guard stock >= ingredient.amount else { return .failure(BuyError.ingredientShortage) }
        }
        return .success(true)
    }

    
    private func makeJuice(with recipe: [FruitNameAndAmount]) {
        recipe.forEach { fruitStore.useStock(fruit: $0) }
    }
}
