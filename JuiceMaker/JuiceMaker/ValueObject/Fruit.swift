//
//  Fruit.swift
//  JuiceMaker
//
//  Created by Eunsoo KIM on 2021/10/19.
//

import Foundation

class Fruit {
    enum Name {
        case strawberry
        case banana
        case kiwi
        case pineapple
        case mango
    }
    
    let name: Name
    private(set) var quantity: Int
    
    init(name: Name, quantity: Int) {
        self.name = name
        self.quantity = quantity
    }
    
    func changeQuantity(to newQuantity: Int) {
        self.quantity = newQuantity
    }
}
