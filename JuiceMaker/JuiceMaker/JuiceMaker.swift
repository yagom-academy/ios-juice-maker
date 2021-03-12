//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

struct JuiceMaker {
    var fruitInformation: [FruitTypes: FruitManager] = [
        .strawberry: FruitManager(.strawberry),
        .banana: FruitManager(.banana),
        .kiwi: FruitManager(.kiwi),
        .mango: FruitManager(.mango),
        .pineapple: FruitManager(.pineapple)
    ]
    
    func makeJuice(of orderedMenu: JuiceTypes) -> Bool {
        for (fruitType, requiredAmount) in orderedMenu.recipe() {
            if let fruit = fruitInformation[fruitType], fruit.haveStock(requiredAmount) {
                    fruit.subtractStock(requiredAmount)
                } else { return false }
            }
        return true
    }
}
