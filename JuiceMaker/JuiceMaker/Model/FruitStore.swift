//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//


import Foundation

// 과일 저장소 타입
class FruitStore {
    enum Fruit: CaseIterable {
        case staryberry
        case banana
        case fineapple
        case kiwi
        case mango
    }
    
    enum Errors: Error {
        case noneOfInput
        case invalidValue
    }
    
    var defaultStock : Int
    var fruitStorage : Dictionary<Fruit, Int>
    let allFruits : Array<Fruit>
    let stock : Array<Int>
    
    init() {
        defaultStock = 10
        allFruits = Fruit.allCases
        stock = Array(repeating: defaultStock, count: allFruits.count)
        fruitStorage = Dictionary(uniqueKeysWithValues: zip(allFruits, stock))
    }
    
    func changeFruitStorage(fruit: Fruit, to number: Int) {
        fruitStorage.keys.forEach{
            if $0 == fruit {
                fruitStorage[$0] = number
            }
        }
    }
    
    func inputStockToChange() throws -> Int {
        guard let stockToChange = readLine() else {
            throw Errors.noneOfInput
        }
        
        guard let stockToChange = Int(stockToChange) else {
            throw Errors.invalidValue
        }
        
        return stockToChange
    }
}





