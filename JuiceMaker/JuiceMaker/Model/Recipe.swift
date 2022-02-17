//
//  Recipe.swift
//  JuiceMaker
//
//  Created by temp2 on 2022/02/15.
//

import Foundation

/// 레시피 타입
struct Recipe {
    var fruitList: [FruitInfo]
}

struct FruitInfo {
    var fruit: Fruit
    var quantity: Int
}
