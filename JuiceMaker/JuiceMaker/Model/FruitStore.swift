//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

class FruitStore {
    private var fruits: Fruits
    
    init(fruits: Fruits) {
        self.fruits = fruits
    }

    // MARK: - 쥬스 제작 관련 메서드
    func pickUpFruits(for menu: FruitJuice) -> Result<FruitJuice, FruitError> {
        let recipe = menu.chooseRecipe()
        guard fruits.hasEnoughFruits(toMake: recipe) else {
            return .failure(.insufficientFruit)
        }
        fruits.useFruits(toMake: recipe)
        return .success(menu)
    }
}
