//
//  FruitCounter.swift
//  JuiceMaker
//
//  Created by Oh Donggeon on 2022/02/15.
//

import Foundation

class FruitCounter {
    
    let fruit: Fruit
    private(set) var count: Int
    
    var name: String {
        fruit.name
    }
    
    init(fruit: Fruit, count: Int) {
        self.fruit = fruit
        self.count = count
    }
    
    func change(count: Int) {
        self.count = count
    }
    
}
