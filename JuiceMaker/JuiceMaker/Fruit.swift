//
//  Fruits.swift
//  JuiceMaker
//
//  Created by 천수현 on 2021/03/08.
//

class Fruit {
    private(set) var stock: Int = 10
    
    func subtractStock(amount: Int) {
        self.stock -= amount
    }
    
    func addStock(amount: Int) {
        self.stock += amount
    }
}

enum FruitType {
    static let strawberry = Fruit()
    static let banana = Fruit()
    static let kiwi = Fruit()
    static let pineapple = Fruit()
    static let mango = Fruit()
}
