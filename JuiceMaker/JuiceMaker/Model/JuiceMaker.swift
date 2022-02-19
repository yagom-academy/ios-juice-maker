//
//  JuiceMaker - JuiceMaker.swift
//  Created by 추니 & Davy.
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    private var fruitStore: FruitStore
    
    init(fruitStore: FruitStore) {
        self.fruitStore = fruitStore
    }
    
    func makeJuice(type juice: Juice) -> JuiceResult {
        switch juice {
        case .strawberryJuice:
            let strawberryJuiceRecipe = FruitAmountInformation(fruit: .strawberry, amount: -16)
            return validateMakeJuice([strawberryJuiceRecipe])
        case .bananaJuice:
            let bananaJuiceRecipe = FruitAmountInformation(fruit: .banana, amount: -2)
            return validateMakeJuice([bananaJuiceRecipe])
        case .kiwiJuice:
            let kiwiJuiceRecipe = FruitAmountInformation(fruit: .kiwi, amount: -3)
            return validateMakeJuice([kiwiJuiceRecipe])
        case .pineappleJuice:
            let pineappleJuiceRecipe = FruitAmountInformation(fruit: .pineapple, amount: -2)
            return validateMakeJuice([pineappleJuiceRecipe])
        case .strawberryBananaJuice:
            let strawberryJuiceRecipe = FruitAmountInformation(fruit: .strawberry, amount: -10)
            let bananaJuiceRecipe = FruitAmountInformation(fruit: .banana, amount: -1)
            return validateMakeJuice([strawberryJuiceRecipe, bananaJuiceRecipe])
        case .mangoJuice:
            let mangoJuiceRecipe = FruitAmountInformation(fruit: .mango, amount: -3)
            return validateMakeJuice([mangoJuiceRecipe])
        case .mangoKiwiJuice:
            let mangoJuiceRecipe = FruitAmountInformation(fruit: .mango, amount: -2)
            let kiwiJuiceRecipe = FruitAmountInformation(fruit: .kiwi, amount: -1)
            return validateMakeJuice([mangoJuiceRecipe, kiwiJuiceRecipe])
        }
    }
    
    private func validateMakeJuice(_ fruits: [FruitAmountInformation]) -> JuiceResult {
        do {
            try fruitStore.changeAmountOfFruit(fruits)
            return JuiceResult(isSuccess: true, message: nil)
        } catch let error as FruitError {
            return JuiceResult(isSuccess: false, message: error.description)
        } catch {
            return JuiceResult(isSuccess: false, message: error.localizedDescription)
        }
    }
}
