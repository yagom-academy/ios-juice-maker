//
//  Fruits.swift
//  JuiceMaker
//
//  Created by 천수현 on 2021/03/08.
//

import Foundation

class Fruit {
    public private(set) var stock: Int = 10
    
    func useStock(_ amount: Int) {
        self.stock -= amount
    }
    
    func addStock(_ amount: Int) {
        self.stock += amount
    }
}
struct Fruits: RawRepresentable {
    let rawValue: Fruit
    static let strawberry = Fruit()
    static let banana = Fruit()
    static let kiwi = Fruit()
    static let pineapple = Fruit()
    static let mango = Fruit()
}
//var strawberry = Fruit()
//var banana = Fruit()
//var kiwi = Fruit()
//var pineapple = Fruit()
//var mango = Fruit()
