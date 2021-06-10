//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

enum FruitStoreError: Error {
    case outOfStock
}

enum Fruit: CaseIterable {
    static let defaultStock = 10
    case strawberry
    case banana
    case kiwi
    case pineapple
    case mango
}

class FruitStore {
    
    var fruits: [Fruit: Int]
    init() {
        var fruits = [Fruit: Int]()
        for key in Fruit.allCases {
            fruits[key] = Fruit.defaultStock
        }
        self.fruits = fruits
    }
    
    /*func makeJuice(for ingredients: [String:Int]) {
        for (ingredient, amount) in ingredients {
            useStocks(ingredient: ingredient, amount: amount)
        }
    }
    
    private func useStocks(ingredient: String, amount: Int) {
        var target: Fruit
        switch ingredient {
        case "strawberry":
            target = strawberry
        case "banana":
            target = banana
        case "kiwi":
            target = kiwi
        case "pineapple":
            target = pineapple
        case "mango":
            target = mango
        default:
            return
        }
        do {
            try target.decreaseStock(number: amount)
        } catch {
            print("재고가 없습니다.")
        }
    }*/
}
