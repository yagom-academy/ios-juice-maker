//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

// 과일 저장소 타입
class FruitStore {
    enum Fruit: CaseIterable {
        case strawberry
        case banana
        case kiwi
        case pineapple
        case mango
    }
    
    typealias FruitData = [Fruit: Int]
    var fruitData: FruitData = [:]
    
    init() {
        let initialInventory = 10
        Fruit.allCases.forEach { element in fruitData[element] = initialInventory }
    }
    
    func reduce(ingredient: FruitData) {
        for fruit in ingredient.keys {
            let amountOfSupply = ingredient[fruit] ?? 0
            guard var fruitData = fruitData[fruit] else {
                return
            }
            print("\(fruit) 사용전 재고: \(fruitData)")
            fruitData -= amountOfSupply
            print("\(fruit) 사용후 재고: \(fruitData)")
        }
    }
    
    func supplyStock(ingredient: FruitData) {
        for fruit in ingredient.keys {
            let amountOfIngredient = ingredient[fruit] ?? 0
            guard var fruitData = fruitData[fruit] else {
                return
            }
            print("\(fruit) 입고전 재고: \(fruitData)")
            fruitData += amountOfIngredient
            print("\(fruit) 입고후 재고: \(fruitData)")
        }
    }
}


