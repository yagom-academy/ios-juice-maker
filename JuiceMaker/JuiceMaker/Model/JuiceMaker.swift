//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//  last modified by Yetti, yy-ss99, Mary.

struct JuiceMaker {
    let fruitStore: FruitStore
    
    func takeOrder(_ juice: Juice) {
        let recipe = juice.receiveRecipe()
        let checked = checkFruitStock(recipe)
        
        make(juice, with: recipe, if: checked)
    }
    
    private func checkFruitStock(_ recipe: [Recipe]) -> Result<Void, JuiceMakerError> {
        for fruit in recipe {
            guard let stock = fruitStore.fruitStock[fruit.name] else { return .failure(JuiceMakerError.notExistFruit) }
            guard stock >= fruit.quantity else { return .failure(JuiceMakerError.ingredientShortage) }
        }
        return .success(())
    }

    private func takeStock(with recipe: [Recipe]) {
        recipe.forEach { fruitStore.useStock(fruit: $0.name, quantity: $0.quantity) }
    }
    
    private func make(_ juice: Juice, with recipe: [Recipe], if checked: Result<Void, JuiceMakerError>) {
        switch checked {
        case .success:
            takeStock(with: recipe)
            print("\(juice)가(이) 준비되었습니다.")
        case .failure(let error):
            print(error)
        }
    }
}
