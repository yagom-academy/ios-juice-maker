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
    
    /// 쥬스 만들기.
    ///
    /// O(N)의 시간 복잡도를 갖고 있음. 이때 N은 쥬스를 만들 때 필요한 과일의 종류 갯수임.
    ///
    /// - Returns: Nothing. 성공했을 경우
    ///
    /// - Parameter of: 만들 쥬스
    ///
    /// - Throws: `JuiceMakerError`타입의 에러. 쥬스 만들기에 실패 했을 경우
    mutating func make(of juice: Juice) throws {
        guard let neededFruits = recipe.recipe(of: juice) else {
            throw JuiceMakerError.notExistRecipe
        }
        try validateStock(of: neededFruits)
        try useStock(of: neededFruits)
    }
    
    /// 쥬스를 만들 때 필요한 과일의 재고가 충분히 존재하는지 확인.
    ///
    /// O(N)의 시간 복잡도를 갖고 있음. 이때 N은 쥬스를 만들 때 필요한 과일의 종류 갯수임.
    ///
    /// - Returns: Nothing. 재고가 충분히 존재 할 경우
    ///
    /// - Parameter of: 필요한 과일과 갯수
    ///
    /// - Throws: `JuiceMakerError.soldOutError` 쥬스 만들 때 필요한 과일의 재고가 모자랄 경우
    private func validateStock(of neededFruits: [Recipe.NeededFruit]) throws {
        let outOfStocks = neededFruits.filter { neededFruit in
            let stock = fruitStore.stock(of: neededFruit.fruit)
            return stock < neededFruit.quantity
        }
        if outOfStocks.count > 0 {
            throw JuiceMakerError.soldOut
        }
    }
    
    /// 쥬스를 만들기 위해 과일 저장소에서 필요한 과일들의 재고 갯수를 감소시킴.
    ///
    /// O(N)의 시간 복잡도를 갖고 있음. 이때 N은 쥬스를 만들 때 필요한 과일의 종류 갯수임.
    ///
    /// - Returns: Nothing.
    ///
    /// - Parameter of: 필요한 과일과 갯수
    mutating private func useStock(of neededFruits: [Recipe.NeededFruit]) throws {
        try neededFruits.forEach { neededFruits in
            try fruitStore.decreaseStock(of: neededFruits.fruit, neededFruits.quantity)
        }
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
