//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

struct JuiceMaker {
    var fruitInformation: [FruitTypes: FruitStock] = [
        .strawberry: FruitStock(.strawberry),
        .banana: FruitStock(.banana),
        .kiwi: FruitStock(.kiwi),
        .mango: FruitStock(.mango),
        .pineapple: FruitStock(.pineapple)
    ]
    
    func canMakeJuice(of orderedMenu: JuiceTypes) -> Bool {
        for (fruitType, requiredAmount) in orderedMenu.recipe() {
            if let fruit = fruitInformation[fruitType], fruit.haveStock(requiredAmount) {
                    fruit.subtractStock(requiredAmount)
                } else { return false }
            }
        return true
    }
}
