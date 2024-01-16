//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum FruitStoreError: Error {
    case fruitNotFound
    case outOfStock
}

enum Fruit: CaseIterable {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
}
// 과일 저장소 타입
class FruitStore {
    var fruitsStock: Dictionary<Fruit, Int> = [:]

    init() {
        for fruit in Fruit.allCases {
            fruitsStock[fruit] = 10
        }
    }
    
    func fillStock(fruit: Fruit, amount: Int) throws {
        let stockOfFruit = try takeStock(fruit: fruit)
        
        fruitsStock[fruit] = stockOfFruit + amount
    }
    
    func consumeStock(fruit: Fruit, amount: Int) throws {
        if checkStock(fruit: fruit, amount: amount) {
            fruitsStock[fruit] = try takeStock(fruit: fruit) - amount
        } else {
            throw FruitStoreError.outOfStock
        }
    }
    
    func checkStock(fruit: Fruit, amount: Int) -> Bool {
        do {
            let stockOfFruit = try takeStock(fruit: fruit)
            
            return stockOfFruit >= amount ? true : false
        } catch FruitStoreError.fruitNotFound {
            print("해당 과일이 존재하지 않습니다.")
        } catch {
            print("알 수 없는 오류입니다.")
        }
        
        return false
    }
    
    func takeStock(fruit: Fruit) throws -> Int {
        guard let stockOfFruit = fruitsStock[fruit] else {
            throw FruitStoreError.fruitNotFound
        }
        
        return stockOfFruit
    }
}
