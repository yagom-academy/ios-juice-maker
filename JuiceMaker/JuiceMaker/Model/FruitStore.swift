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
    var stock = 10
    
    func increaseStock() {
        stock += 1
    }
    
    func decreaseStock() throws {
        if stock - 1 < 0 {
            throw FruitStoreError.outOfStock
        }
        stock -= 1
    }
    
    func decreaseStock(number: Int) throws {
        if stock - number < 0 {
            throw FruitStoreError.outOfStock
        }
        stock -= number
    }
}

class FruitStore {
    let strawberry = Fruit()
    let banana = Fruit()
    let kiwi = Fruit()
    let pineapple = Fruit()
    let mango = Fruit()
    
    func makeJuice(for ingredients: [String:Int]) {
        for (ingredient, amount) in ingredients {
            useStocks(ingredient: ingredient, amount: amount)
        }
    }
    
    func useStocks(ingredient: String, amount: Int) {
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
