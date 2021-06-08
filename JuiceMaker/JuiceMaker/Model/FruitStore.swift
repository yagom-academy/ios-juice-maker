//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

// 과일 타입
class Fruit {
    var stock = 10
    
    func increaseStock() {
        stock += 1
    }
    func decreaseStock() {
        stock -= 1
    }
    func decreaseStock(number: Int) {
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
        target.decreaseStock(number: amount)
    }
}
