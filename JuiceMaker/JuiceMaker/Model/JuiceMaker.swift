//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

struct JuiceMaker {
    private var store = FruitStore()
    
    func make(juice: Menu) throws {
        let isPossible = try store.hasEnoughInventory(of: juice.recipe, in: store.fruitsInventory)
        
        if isPossible {
            try store.reduceInventory(of: juice.recipe)
            print("(juice)쥬스 나왔습니다! 맛있게 드세요!")
        } else {
            throw AppError.lackOfInventory
        }
    }
}
