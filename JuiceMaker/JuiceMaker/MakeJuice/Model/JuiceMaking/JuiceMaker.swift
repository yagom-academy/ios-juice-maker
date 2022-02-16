//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    
    private var fruitStore: FruitStore
    private var recipe: Recipe
    
    init(fruitStore: FruitStore = FruitStore(), recipe: Recipe = Recipe()) {
        self.fruitStore = fruitStore
        self.recipe = recipe

    }
    
    func stock(of fruit: FruitStore.Fruit) -> Quantity {
        return fruitStore.stock(of: fruit)
    }
    
    
}

extension JuiceMaker {
    
    /// 과일 쥬스의 종류
    enum Juice {
        case strawberryJuice, bananaJuice, kiwiJuice, pineappleJuice
        case strawberryBananaJuice, mangoJuice, mangoKiwiJuice
    }
    
    /// 과일 쥬스를 만들던 도중 발생할 수 있는 에러
    enum JuiceMakerError: Error {
        case soldOut
        case notExistRecipe
    }
    
    /// 과일 쥬스를 만들 때 필요한 과일과 갯수의 정보를 알려주는 레시피 타입
    struct Recipe {
        
        private static let defaultRecipe: [Juice: [NeededFruit]] = [
            .strawberryJuice: [
                NeededFruit(fruit: .strawberry, quantity: Quantity(16)),
            ],
            .bananaJuice: [
                NeededFruit(fruit: .banana, quantity: Quantity(2)),
            ],
            .kiwiJuice: [
                NeededFruit(fruit: .banana, quantity: Quantity(3)),
            ],
            .pineappleJuice: [
                NeededFruit(fruit: .pineapple, quantity: Quantity(2)),
            ],
            .strawberryBananaJuice: [
                NeededFruit(fruit: .strawberry, quantity: Quantity(10)),
                NeededFruit(fruit: .banana, quantity: Quantity(2)),
            ],
            .mangoJuice: [
                NeededFruit(fruit: .mango, quantity: Quantity(3)),
            ],
            .mangoKiwiJuice: [
                NeededFruit(fruit: .mango, quantity: Quantity(2)),
                NeededFruit(fruit: .kiwi, quantity: Quantity(1)),
            ],
        ]
        
        /// 필요한 과일과 갯수의 정보를 갖고 있는 타입
        struct NeededFruit {
            let fruit: FruitStore.Fruit
            let quantity: Quantity
        }
        
        private let recipe: [Juice: [NeededFruit]]
        
        init(recipe: [Juice: [NeededFruit]] = defaultRecipe) {
            self.recipe = recipe
        }
        
        /// 필요한 과일과 갯수를 얻기.
        ///
        /// - Returns: `[NeededFruit]?` 필요한 과일들과 그 갯수. 존재하지 않을 경우 nil
        ///
        /// - Parameter _: 필요한 과일들을 알고 싶은 쥬스의 종류
        func recipe(of juice: Juice) -> [NeededFruit]? {
            return recipe[juice]
        }
    }
}
