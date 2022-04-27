//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    private var fruitStore = FruitStore()
    
    func makeJuice(juiceName: JuiceKind) throws {
        do{
            switch juiceName {
            case .strawberryJuice:
                try fruitStore.subtractFruitAmount(juiceRecipe: JuiceKind.strawberryJuice.recipe)
            case .bananaJuice:
                try fruitStore.subtractFruitAmount(juiceRecipe: JuiceKind.bananaJuice.recipe)
            case .kiwiJuice:
                try fruitStore.subtractFruitAmount(juiceRecipe: JuiceKind.kiwiJuice.recipe)
            case .pineappleJuice:
                try fruitStore.subtractFruitAmount(juiceRecipe: JuiceKind.pineappleJuice.recipe)
            case .mangoJuice:
                try fruitStore.subtractFruitAmount(juiceRecipe: JuiceKind.mangoJuice.recipe)
            case .strawberryBananaJuice:
                try fruitStore.subtractFruitAmount(juiceRecipe: JuiceKind.strawberryBananaJuice.recipe)
            case .mangoKiwiJuice:
                try fruitStore.subtractFruitAmount(juiceRecipe: JuiceKind.mangoKiwiJuice.recipe)
            }
        } catch ErrorCategory.zeroError {
            print("\(ErrorCategory.zeroError.message)")
        } catch ErrorCategory.cannotError {
            print("\(ErrorCategory.cannotError.message)")
        }
    }
}
