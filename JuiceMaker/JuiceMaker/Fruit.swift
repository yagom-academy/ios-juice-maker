//
//  Fruit.swift
//  JuiceMaker
//
//  Created by 강인희 on 2020/11/16.
//

import Foundation

struct Fruit {
    var fruitName: String
    var previousStock: Int
    var addedStock: Int
    var currentStock: Int {
        get {
            return previousStock + addedStock
        }
    }
    
    init(fruitName: String, currentStock: Int) {
        self.fruitName = fruitName
        self.previousStock = currentStock
        self.addedStock = 0
        
    }
}
