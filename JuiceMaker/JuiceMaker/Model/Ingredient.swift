//
//  ingredient.swift
//  JuiceMaker
//
//  Created by 강경 on 2022/02/16.
//

import Foundation

struct Ingredient {
    let fruit: Fruit
    let number: Int
    
    init(fruit: Fruit, number: Int) {
        self.fruit = fruit
        self.number = number
    }
}
