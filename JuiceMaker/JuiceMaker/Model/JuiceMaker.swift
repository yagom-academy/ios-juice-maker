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
        if store.isInventoryEnough(for: juice.recipe) {
            try store.reduceInventory(of: juice.recipe)
        } else {
            throw AppError.lackOfInventory
        }
    }
}
