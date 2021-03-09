//
//  Juice.swift
//  JuiceMaker
//
//  Created by 기원우 on 2021/03/09.
//

import Foundation

class Juice {
    var recipe: [(Fruit, Int)]
    
    init(require: [(Fruit, Int)]) {
        self.recipe = require
    }
}

var strawberryJuice = Juice(require: [(strawberry, 16)])
var bananaJuice = Juice(require: [(banana, 2)])
var kiwiJuice = Juice(require: [(kiwi, 3)])
var pineaplleJucie = Juice(require: [(pineapple, 2)])
var strawbaJuice = Juice(require: [(strawberry, 10), (banana, 1)])
var mangoJuice = Juice(require: [(mango, 3)])
var mangokiwiJuice = Juice(require: [(mango, 2), (kiwi, 1)])
