//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    private let fruitStore: FruitStore = FruitStore()
    
    private func useIngredient(_ juice: Juice) throws {
        let ingredient = juice.ingredients
        
        for (fruit, amount) in ingredient {
            try fruitStore.useFruits(amount, to: fruit)
        }
    }
    
    func makeJuice(_ juice: Juice) {
        do {
            try useIngredient(juice)
        } catch JuiceMakerError.nonExistentFruit {
            print("없는 과일입니다.")
        } catch JuiceMakerError.outOfStock {
            print("재고가 부족합니다.")
        } catch JuiceMakerError.nonExistentJuice {
            print("없는 쥬스입니다.")
        } catch {
            print("알수없는 에러: \(error.localizedDescription)")
        }
    }
}

