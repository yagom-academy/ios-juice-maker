//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//  last modified by Yetti, yy-ss99, Mary.

struct JuiceMaker {
    let fruitStore: FruitStore
    
    func takeOrder(_ juice: Juice) {
        let recipes = juice.receiveRecipe()
        let check = checkFruitStock(recipes)
        
        switch check {
        case .success:
            makeJuice(with: recipes)
            print("\(juice)가(이) 준비되었습니다.")
        case .failure(let error):
            print(error)
        }
    }
    
    private func checkFruitStock(_ recipes: [FruitNameAndAmount]) -> Result<Bool, JuiceMakerError> {
        for fruit in recipes {
            guard let stock = fruitStore.fruitStock[fruit.name] else { return .failure(JuiceMakerError.notExistFruit) }
            guard stock >= fruit.amount else { return .failure(JuiceMakerError.ingredientShortage) }
        }
        return .success(true)
    }

    private func makeJuice(with recipes: [FruitNameAndAmount]) {
        recipes.forEach { fruitStore.useStock(fruit: $0) }
    }
}
