//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

struct JuiceMaker {
    // MARK: - Properties
    
    private(set) var store = FruitStore()
    static let shared = JuiceMaker()
    
    // MARK: - Initializer
    
    private init() { }
    
    // MARK: - Action
    
    func make(juice: Menu) throws {
        let fruitsToUse = store.grabIngredients(of: juice.recipe)
        
        guard fruitsToUse != nil else {
            throw AppError.lackOfInventory
        }
        
        try store.reduceInventory(of: juice.recipe)
    }
}
