//
//  ExistingStock.swift
//  JuiceMaker
//
//  Created by hugh, yeton on 2022/05/13.
//

import Foundation

struct FruitInventory {
    private var stock = [Fruit: Int]()
    
    var currentStock: [Fruit: Int] {
        get {
            return stock
        } set(newStock) {
            stock = newStock
        }
    }
}
