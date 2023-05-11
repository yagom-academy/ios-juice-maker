//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    private let fruitStore: FruitStore = FruitStore()
    private let juiceRecipe: [Juice: [Fruit: Int]] = [
        Juice.strawberryJuice: [Fruit.strawberry: 16],
        Juice.bananaJuice: [Fruit.banana: 2],
        Juice.kiwiJuice: [Fruit.kiwi: 3],
        Juice.pineappleJuice: [Fruit.pineapple: 2],
        Juice.strawberryBananaJuice: [Fruit.strawberry: 10, Fruit.banana: 1],
        Juice.mangoJuice: [Fruit.mango: 3],
        Juice.mangoKiwiJuice: [Fruit.mango: 2, Fruit.kiwi: 1]
    ]
    
    private func getIngredient(_ juice: Juice) throws -> [Fruit: Int]{
        guard let ingredient = juiceRecipe[juice] else { throw JuiceMakerError.nonExistentJuiceError }
        
        return ingredient
    }
    
    private func useIngredient(_ juice: Juice) throws {
        let ingredient = try getIngredient(juice)
        
        for (fruit, useStock) in ingredient {
            try fruitStore.useFruits(useStock, fruit)
        }
    }
    
    func makeJuice(_ juice: Juice) {
        do {
            try useIngredient(juice)
        } catch JuiceMakerError.nonExistentFruitError {
            print("없는 과일입니다.")
        } catch JuiceMakerError.outOfStockError {
            print("재고가 부족합니다.")
        } catch JuiceMakerError.nonExistentJuiceError {
            print("없는 쥬스입니다.")
        } catch {
            print("알수없는 에러: \(error.localizedDescription)")
        }
    }
}

