//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Fruit: CaseIterable {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
}

// 과일 저장소 타입
class FruitStore {
    var fruitsStock: [Fruit: Int] = Dictionary(uniqueKeysWithValues: Fruit.allCases.map{ ($0, 10) })
    
    func getStock(_ fruit: Fruit) throws -> Int {
        guard let stock = fruitsStock[fruit] else { throw InputError.nameError }
        
        return stock
    }
    
    func addFruits(_ addStock: Int, _ addFruit: Fruit) throws -> Int {
        var stock = try getStock(addFruit)
        stock += addStock
        
        return stock
    }
    
    func useFruits(_ useStock: Int, _ useFruit: Fruit) throws -> Int {
        var stock = try getStock(useFruit)
        stock -= useStock
        
        return stock
    }
}


