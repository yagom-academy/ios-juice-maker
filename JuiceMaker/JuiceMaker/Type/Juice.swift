//
//  Juice.swift
//  JuiceMaker
//
//  Created by 기원우 on 2021/03/09.
//

import Foundation

class Juice {
    var recipe: [(Fruit, Int)]
    
    init(setRecipe: [(Fruit, Int)]) {
        self.recipe = setRecipe
    }
}

var strawberryJuice = Juice(setRecipe: [(strawberry, 16)])
var bananaJuice = Juice(setRecipe: [(banana, 2)])
var kiwiJuice = Juice(setRecipe: [(kiwi, 3)])
var pineaplleJucie = Juice(setRecipe: [(pineapple, 2)])
var strawbaJuice = Juice(setRecipe: [(strawberry, 10), (banana, 1)])
var mangoJuice = Juice(setRecipe: [(mango, 3)])
var mangokiwiJuice = Juice(setRecipe: [(mango, 2), (kiwi, 1)])
