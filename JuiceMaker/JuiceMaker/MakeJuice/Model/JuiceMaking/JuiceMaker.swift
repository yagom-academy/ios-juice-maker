//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    private var fruitStore: FruitStore
    private var recipe: Recipe
    
    init(
        fruitStore: FruitStore = FruitStore(),
        recipe: Recipe = Recipe()
    ) {
        self.fruitStore = fruitStore
        self.recipe = recipe
    }
    
    func stock(of fruit: FruitStore.Fruit) -> Quantity {
        return fruitStore.stock(of: fruit)
    }
    
    /// JuiceManufacturer가 주스를 만들도록 요청
    /// 성공하면 재고 업데이트, 실패하면 에러 반환
    ///
    /// - Returns: `[FruitStore.Fruit]` 주스 제조할 때 사용한 과일의 종류 반환. 성공했을 경우
    ///
    /// - Parameter _: 주문한 쥬스의 종류
    mutating func order(_ juice: Juice) throws -> [FruitStore.Fruit] {
        var manufacturer = JuiceManufacturer(fruitStore, recipe)
        let store = try manufacturer.make(of: juice)
        fruitStore = store
        
        guard let fruits = recipe.fruitsNeeded(in: juice)
        else { throw JuiceManufacturerError.notExistRecipe }
        
        return fruits
    }
}

extension JuiceMaker {
    /// 과일 쥬스의 종류
    enum Juice {
        case strawberryJuice, bananaJuice, kiwiJuice, pineappleJuice
        case strawberryBananaJuice, mangoJuice, mangoKiwiJuice
        case unknowned
        
        init(index: Int) {
            switch index {
            case 0: self = .strawberryBananaJuice
            case 1: self = .mangoKiwiJuice
            case 2: self = .strawberryJuice
            case 3: self = .bananaJuice
            case 4: self = .pineappleJuice
            case 5: self = .kiwiJuice
            case 6: self = .mangoJuice
            default: self = .unknowned
            }
        }
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
                NeededFruit(fruit: .kiwi, quantity: Quantity(3)),
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
        
        
        /// 원하는 주스를 만들기 위해 필요한 과일의 종류 얻기
        ///
        /// - Returns: `[FruitStore.Fruit]?` 필요한 과일의 종류. 존재하지 않을 경우 nil
        ///
        /// - Parameter _: 필요한 과일들을 알고 싶은 쥬스의 종류
        func fruitsNeeded(in juice: Juice) -> [FruitStore.Fruit]? {
            return recipe(of: juice)?.map({$0.fruit})
        }
    }
}
