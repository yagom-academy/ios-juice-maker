//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

class FruitStore {
    private var strawberry = 10
    private var banana = 10
    private var pineapple = 10
    private var kiwi = 10
    private var mango = 10
}

extension FruitStore {
    
    func pickUpFruits(for menu: FruitJuice) -> PickUpFruitResult {
        let recipe = menu.pickUpRecipe()
        return useFruits(strawberry: recipe.strawberry,
                         banana: recipe.banana,
                         pineapple: recipe.pineapple,
                         kiwi: recipe.kiwi,
                         mango: recipe.mango)
    }
    
    private func useFruits(strawberry: Int, banana: Int, pineapple: Int, kiwi: Int, mango: Int) -> PickUpFruitResult {
        guard self.strawberry >= strawberry,
              self.banana >= banana,
              self.pineapple >= pineapple,
              self.kiwi >= kiwi,
              self.mango >= mango else {
            return PickUpFruitResult.failure
        }
        
        self.strawberry -= strawberry
        self.banana -= banana
        self.pineapple -= pineapple
        self.kiwi -= kiwi
        self.mango -= mango
        return PickUpFruitResult.success
    }
}
