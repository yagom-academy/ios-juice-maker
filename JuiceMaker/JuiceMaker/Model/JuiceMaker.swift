//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

struct JuiceMaker {
    private(set) var store = FruitStore()
        
    func make(juice: Menu) throws {
        let fruitsToUse = store.grabIngredients(of: juice.recipe)
        
        guard fruitsToUse != nil else { throw AppError.lackOfInventory }
        
        try store.reduceInventory(of: juice.recipe)
        print("\(juice)쥬스 나왔습니다! 맛있게 드세요!")
    }
}
