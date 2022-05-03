//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

class FruitStore {
    var fruits: Fruits
    
    init(fruits: Fruits) {
        self.fruits = fruits
    }

    // MARK: - 쥬스 제작 관련 메서드
    func pickUpFruits(for menu: FruitJuice) -> Result<FruitJuice, FruitError> {
        let recipe = menu.recipe
        guard hasEnoughFruits(toMake: recipe) else {
            return .failure(.insufficientFruit)
        }
        useFruits(toMake: recipe)
        return .success(menu)
    }
    
    private func hasEnoughFruits(toMake recipe: Fruits) -> Bool {
        return (fruits.strawberry >= recipe.strawberry
                && fruits.banana >= recipe.banana
                && fruits.kiwi >= recipe.kiwi
                && fruits.pineapple >= recipe.pineapple
                && fruits.mango >= recipe.mango)
    }
    
    private func useFruits(toMake recipe: Fruits) {
        fruits.strawberry -= recipe.strawberry
        fruits.banana -= recipe.banana
        fruits.kiwi -= recipe.kiwi
        fruits.pineapple -= recipe.pineapple
        fruits.mango -= recipe.mango
    }
}
