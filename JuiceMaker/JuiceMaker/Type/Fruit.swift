//
//  Fruit.swift
//  JuiceMaker
//
//  Created by 기원우 on 2021/03/09.
//

import Foundation

class Fruit {
    var stock: Int = 10
    
    func upStock(count: Int) {
        self.stock -= count
    }
    
    func downStock(count: Int) {
        self.stock -= count
    }
}

var strawberry = Fruit()
var banana = Fruit()
var pineapple = Fruit()
var kiwi = Fruit()
var mango = Fruit()
