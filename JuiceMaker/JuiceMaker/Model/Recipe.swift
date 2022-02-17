//
//  Recipe.swift
//  JuiceMaker
//
//  Created by temp2 on 2022/02/15.
//

import Foundation

struct Recipe {
    var fruitList: [FruitInfo]
}

struct FruitInfo {
    var fruit: Fruit
    var count: Int
}
