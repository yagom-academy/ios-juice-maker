//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    enum Juice: Int {
        case strawberryJuice
        case bananaJuice
        case kiwiJuice
        case pineappleJuice
        case strawberryBananaJuice
        case mangoJuice
        case mangoKiwiJuice
        
        struct Recipe {
            let ingredient: [Fruit: Int]
        }
        
        var recipe: Recipe {
            switch self {
            case .strawberryJuice:
                return Recipe(ingredient: [.strawberry: 16])
            case .bananaJuice:
                return Recipe(ingredient: [.banana: 2])
            case .kiwiJuice:
                return Recipe(ingredient: [.kiwi: 3])
            case .pineappleJuice:
                return Recipe(ingredient: [.pineapple: 2])
            case .strawberryBananaJuice:
                return Recipe(ingredient: [.strawberry: 10, .banana: 1])
            case .mangoJuice:
                return Recipe(ingredient: [.mango: 3])
            case .mangoKiwiJuice:
                return Recipe(ingredient: [.mango: 2, .kiwi: 1])
            }
        }
        
        var orderSucceedMessage: String {
            switch self {
            case .strawberryJuice:
                return "딸기쥬스 나왔습니다! 맛있게 드세요!"
            case .bananaJuice:
                return "바나나쥬스 나왔습니다! 맛있게 드세요!"
            case .kiwiJuice:
                return "키위쥬스 나왔습니다! 맛있게 드세요!"
            case .mangoJuice:
                return "망고쥬스 나왔습니다! 맛있게 드세요!"
            case .mangoKiwiJuice:
                return "망키쥬스 나왔습니다! 맛있게 드세요!"
            case .pineappleJuice:
                return "파인애플쥬스 나왔습니다! 맛있게 드세요!"
            case .strawberryBananaJuice:
                return "딸바쥬스 나왔습니다! 맛있게 드세요!"
            }
        }
        
        var orderFailedMessage: String {
            switch self {
            case .strawberryJuice:
                return "딸기쥬스 재료가 모자라요. 재고를 수정할까요?"
            case .bananaJuice:
                return "바나나쥬스 재료가 모자라요. 재고를 수정할까요?"
            case .kiwiJuice:
                return "키위쥬스 재료가 모자라요. 재고를 수정할까요?"
            case .pineappleJuice:
                return "파인애플쥬스 재료가 모자라요. 재고를 수정할까요?"
            case .strawberryBananaJuice:
                return "딸바쥬스 재료가 모자라요. 재고를 수정할까요?"
            case .mangoJuice:
                return "망고쥬스 재료가 모자라요. 재고를 수정할까요?"
            case .mangoKiwiJuice:
                return "망키쥬스 재료가 모자라요. 재고를 수정할까요?"
            }
        }
    }
    
    private let fruitStore = FruitStore()
    
    func produce(juice: Juice) throws {
        let recipe = juice.recipe
        try fruitStore.checkStock(for: juice)
        for (fruit, amount) in recipe.ingredient {
            fruitStore.use(fruit, amountOf: amount)
        }
    }
    
    func fetchStock(of fruit: Fruit) throws -> Int {
        return try fruitStore.fetchStock(of: fruit)
    }
    
    func updateAllStock(using fruitStock: [Fruit: Int]) {
        fruitStock.forEach({ (fruit, stock) in
            fruitStore.updateFruitStock(fruit: fruit, amountOf: stock)
        })
    }
    
    func fetchFruitStore() -> FruitStore {
        return self.fruitStore
    }
}
