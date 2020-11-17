//
//  Fruit.swift
//  JuiceMaker
//
//  Created by 강인희 on 2020/11/16.
//

import Foundation

class Fruit {
    var fruitName: String
    var currentStock: Int
    
    init(fruitName: String, currentStock: Int) {
        self.fruitName = fruitName
        self.currentStock = currentStock
    }
}
