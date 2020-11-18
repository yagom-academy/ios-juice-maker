//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Fruit {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
}

enum Juice {
    case strawberryJuice
    case bananaJuice
    case kiwiJuice
    case pineappleJuice
    case strawberryBananaJuice
    case mangoJuice
    case mangoKiwiJuice
}

enum JuiceMakerError: Error {
    case lowStock
    case noRecipe
    case noStockList
}

struct JuiceMaker {
        
    private var fruitStocks: [Fruit: Int] = [
        .strawberry:0,
        .banana:0,
        .pineapple:0,
        .kiwi:0,
        .mango:0
    ]
    
    private var juiceRecipes: [Juice:[Fruit: Int]] = [
        .strawberryJuice:[.strawberry:16],
        .bananaJuice:[.banana:2],
        .kiwiJuice:[.kiwi:3],
        .pineappleJuice:[.pineapple:2],
        .strawberryBananaJuice:[.strawberry:10, .banana:1],
        .mangoJuice:[.mango:3],
        .mangoKiwiJuice:[.mango:2, .kiwi:1]
    ]
    
    func countStock(of fruit: Fruit) -> Int? {
        return fruitStocks[fruit]
    }
    
    mutating func setStock(of fruit: Fruit, count: Int) {
        fruitStocks[fruit] = count
    }
    
    mutating func addStock(of fruit: Fruit, count: Int) {
        guard let currentCount = countStock(of: fruit) else {
            print("\(fruit)가 재고 목록에 없음")
            return
        }
        
        fruitStocks[fruit] = currentCount + count
    }
    
    mutating func subtractStock(of fruit: Fruit, count: Int) {
        guard let currentCount = countStock(of: fruit) else {
            print("\(fruit)가 재고 목록에 없음")
            return
        }
   
        fruitStocks[fruit] = currentCount - count
    }
    
    mutating func make(juice: Juice) throws {
        // 레시피 가져오기
        guard let recipe = juiceRecipes[juice] else {
            throw JuiceMakerError.noRecipe
        }
        
        // 레시피에 필요한 과일의 재고 있는지 확인
        for (fruit, count) in recipe {
            guard let currentCount = countStock(of: fruit) else {
                throw JuiceMakerError.noStockList
            }
            
            guard currentCount >= count else {
                throw JuiceMakerError.lowStock
            }
        }
        
        // 필요한 과일의 재고가 있으면 재고 소모
        for (fruit, count) in recipe {
            subtractStock(of: fruit, count: count)
        }
    }
}
