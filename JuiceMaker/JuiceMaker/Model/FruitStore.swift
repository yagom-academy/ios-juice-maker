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
    
    typealias FruitsStock = [Fruit: Int]
    var fruitsStock: FruitsStock = [:]
    
    init() {
        let initialStock = 10
        Fruit.allCases.forEach { eachFruit in fruitsStock[eachFruit] = initialStock }
    }
    
    func reduce(ingredient: FruitsStock) {
        for fruit in ingredient.keys {
            let amountOfIngredient = ingredient[fruit] ?? 0
            guard var stock = fruitsStock[fruit] else { return }
            print("\(fruit) 사용전 재고: \(stock)")
            stock -= amountOfIngredient
            print("\(fruit) 사용후 재고: \(stock)")
        }
    }

    func supplyStock(ingredient: FruitsStock) {
        for fruit in ingredient.keys {
            let amountOfSupply = ingredient[fruit] ?? 0
            guard var stock = fruitsStock[fruit] else { return }
            print("\(fruit) 입고전 재고: \(stock)")
            stock += amountOfSupply
            print("\(fruit) 입고후 재고: \(stock)")
        }
    }
    
    func isPossibleToMake(of ingredient: FruitsStock, in stock: FruitsStock) throws -> Bool {
        for fruit in ingredient.keys {
            let requiredIngredient = ingredient[fruit] ?? 0
            let fruitStock = stock[fruit] ?? 0
            
            if fruitStock >= requiredIngredient {
                continue
            } else {
                throw AppError.lackOfStock
            }
        }
        return true
    }
}
