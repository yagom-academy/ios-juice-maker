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
    var defaultStock : Int
    let allFruits : Array<Fruit>
    let stock : Array<Int>
    let fruitStorage : Dictionary<Fruit,Int>
    init() {
        defaultStock = 10
        allFruits = Fruit.allCases
        stock = Array(repeating: defaultStock, count: allFruits.count)
        fruitStorage = Dictionary(uniqueKeysWithValues: zip(allFruits, stock))
    }
}





