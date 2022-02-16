//
//  ingredient.swift
//  JuiceMaker
//
//  Created by 강경 on 2022/02/16.
//

import Foundation

struct Ingredient {
    private let fruit: Fruit
    private let number: Int
    
    init(fruit: Fruit, number: Int) {
        self.fruit = fruit
        self.number = number
    }
}
