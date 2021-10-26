//
//  Fruit.swift
//  JuiceMaker
//
//  Created by Eunsoo KIM on 2021/10/19.
//

import Foundation

class Fruit {
    enum Name: String, CaseIterable {
        case strawberry = "딸기"
        case banana = "바나나"
        case kiwi = "키위"
        case pineapple = "파인애플"
        case mango = "망고"
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
