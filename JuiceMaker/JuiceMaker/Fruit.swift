//
//  Fruit.swift
//  JuiceMaker
//
//  Created by 오인탁 on 2021/03/11.
//

import Foundation

struct Fruit {
    let name: String
    var quantity: Int = 10

    mutating func useStock(amount: Int) {
        quantity -= amount
    }
    mutating func addStock() {
        quantity += 1
    }
    mutating func subtractStock() {
        quantity -= 1
    }
}

var strawberry: Fruit = Fruit(name: "딸기")
var banana: Fruit = Fruit(name: "바나나")
var kiwi: Fruit = Fruit(name: "키위")
var pineapple: Fruit = Fruit(name: "파인애플")
var mango: Fruit = Fruit(name: "망고")

