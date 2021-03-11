//
//  Fruit.swift
//  JuiceMaker
//
//  Created by Tak on 2021/03/11.
//

import Foundation

struct Fruit {
    private(set) var quantity: Int = 10

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

enum FruitType {
    static var strawberry: Fruit = Fruit()
    static var banana: Fruit = Fruit()
    static var kiwi: Fruit = Fruit()
    static var pineapple: Fruit = Fruit()
    static var mango: Fruit = Fruit()
}
