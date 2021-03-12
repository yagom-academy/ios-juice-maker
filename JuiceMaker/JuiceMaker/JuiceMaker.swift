//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

struct JuiceMaker {
    var fruitInformation: [FruitTypes: FruitStock] = [
        .strawberry: FruitStock(.strawberry, 10),
        .banana: FruitStock(.banana, 10),
        .kiwi: FruitStock(.kiwi, 10),
        .mango: FruitStock(.mango, 10),
        .pineapple: FruitStock(.pineapple, 10)
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
