//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

struct JuiceMaker {
    static let shared = JuiceMaker()
    
    var fruitInformation: [FruitTypes: FruitStock] = [
        .strawberry: FruitStock(.strawberry),
        .banana: FruitStock(.banana),
        .kiwi: FruitStock(.kiwi),
        .mango: FruitStock(.mango),
        .pineapple: FruitStock(.pineapple)
    ]
    
    func didMakeJuice(of orderedMenu: JuiceTypes) -> Bool {
        for (fruitType, requiredAmount) in orderedMenu.recipe() {
            if let fruit = fruitInformation[fruitType], fruit.isStockExist(requiredAmount) {
                    fruit.subtractStock(requiredAmount)
                } else { return false }
            }
        return true
    }
    
    func fruitStockCount(of fruit: FruitTypes) -> String? {
        guard let fruitStock = fruitInformation[fruit] else { return nil }
        return String(fruitStock.stock)
    }
}
