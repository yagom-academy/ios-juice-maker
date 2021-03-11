//
//  JuiceMaker - Fruit.swift
//
//  Created by 배은서 on 2021/03/08.
//

import Foundation

enum FruitTypes {
    case strawberry, banana, kiwi, pineapple, mango
}

class Fruit {
    private var fruit: FruitTypes
    private(set) var stock: Int

    init(_ fruit: FruitTypes) {
        self.fruit = fruit
        self.stock = 10
    }

    func checkStock(_ requiredFruitAmount: Int) -> Bool {
        if stock < requiredFruitAmount { return false }
        else { return true }
    }

    func subtractStock(_ requiredFruitAmount: Int) {
        stock -= requiredFruitAmount
    }

    func addStock() {
        stock += 1
    }
}
