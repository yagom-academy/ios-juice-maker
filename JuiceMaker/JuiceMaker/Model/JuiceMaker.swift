//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//  last modified by Yetti, yy-ss99, Mary.

struct JuiceMaker {
    let fruitStore: FruitStore
    
    func make(_ juiceType: Juice) {
        let recipe = juiceType.checkRecipe()
        let checkFruit = checkFruit(recipe)
        
        switch checkFruit {
        case .success:
            print("\(juiceType)이(가) 준비되었습니다.")
            makeJuice(recipe)
        case .failure(let error):
            print(error)
        }
    }
    
    private func checkFruit(_ recipe: [IngredientAndAmount]) -> Result<Bool, BuyError> {
        for ingredient in recipe {
            guard let stock = fruitStore.fruitStock[ingredient.name],
                  stock >= ingredient.amount else {
                return .failure(BuyError.ingredientShortage)
            }
        }
        return .success(true)
    }
    
    private func makeJuice(_ recipe: [IngredientAndAmount]) {
        recipe.forEach { fruitStore.useStock(fruit: $0) }
    }
}
