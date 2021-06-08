//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

enum FruitStoreError: Error {
    case outOfStock
}

class Fruit {
    private var stock = 10
    
    fileprivate func increaseStock() {
        stock += 1
    }
    
    fileprivate func decreaseStock() throws {
        if stock - 1 < 0 {
            throw FruitStoreError.outOfStock
        }
        stock -= 1
    }
    
    fileprivate func decreaseStock(number: Int) throws {
        if stock - number < 0 {
            throw FruitStoreError.outOfStock
        }
        stock -= number
    }
}

class FruitStore {
    private let strawberry = Fruit()
    private let banana = Fruit()
    private let kiwi = Fruit()
    private let pineapple = Fruit()
    private let mango = Fruit()
    
    func makeJuice(for ingredients: [String:Int]) {
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
    }
}
