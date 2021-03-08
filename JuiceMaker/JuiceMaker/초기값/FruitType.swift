//
//  Fruits.swift
//  JuiceMaker
//
//  Created by 천수현 on 2021/03/08.
//

import Foundation

class Fruit {
    private var stock: Int = 10
    
    var leftStock: Int {
        get {
            return self.stock
        }
    }
    
    func useStock(_ amount: Int) {
        self.stock -= amount
    }
    
    func addStock(_ amount: Int) {
        self.stock += amount
    }
}

var strawberry = Fruit()
var banana = Fruit()
var kiwi = Fruit()
var pineapple = Fruit()
var mango = Fruit()
