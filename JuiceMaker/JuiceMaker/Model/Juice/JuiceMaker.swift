//  Created by 애종,질리,벨라 on 2022/08/30.

import UIKit

struct JuiceMaker {
    private let fruitStore: FruitStoreProtocol = FruitStore()
    
}

extension JuiceMaker: JuiceMakerProtocol {
    func getFruitStock() -> FruitStock {
        return fruitStore.sendFruitStock()
    }
    
    func canMakeJuice(_ recipe: [Juice.Recipe]) throws {
        return try fruitStore.checkEnoughStock(juiceRecipe: recipe)
    }
    
    func make(_ juice: Juice) {
        for ingredient in juice.recipe {
            fruitStore.updateFruitStock(
                fruit: ingredient.fruit,
                variation: .decrease,
                amount: ingredient.amount
            )
        }
    }
}
