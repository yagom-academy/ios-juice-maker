//
//  JuiceMaker - JuiceMaker.swift
//  Created by som, LJ. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    let fruitStorage = FruitStore(defaultStock: 10)
    
    func makeJuice(of juice: Juice) {
        do {
            try chooseRecipe(order: juice)
        } catch OrderError.outOfStock {
            print(OrderError.outOfStock.message)
        } catch OrderError.emptyStock {
            print(OrderError.emptyStock.message)
        } catch {
            print("알 수 없는 오류입니다.")
        }
    }
    
    func chooseRecipe(order juice: Juice) throws {
        switch juice {
        case .strawberryBananaJuice, .mangoKiwiJuice:
            if let (fruit, amount) = juice.recipeOfJuice.second {
                try fruitStorage.changeFruitStock(fruit: fruit, amount: amount)
            }
            fallthrough
        default:
            let (fruit, amount) = juice.recipeOfJuice.first
            try fruitStorage.changeFruitStock(fruit: fruit, amount: amount)
        }
    }
}
