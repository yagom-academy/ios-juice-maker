//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

struct JuiceMaker {
    var fruits: [FruitTypes: Fruit] = [
        .strawberry: Fruit(.strawberry),
        .banana: Fruit(.banana),
        .kiwi: Fruit(.kiwi),
        .mango: Fruit(.mango),
        .pineapple: Fruit(.pineapple)
    ]
    
    func makeJuice(juice: JuiceTypes) {
        for (fruitType, requiredAmount) in juice.recipe() {
            if let fruit = fruits[fruitType] {
                if fruit.checkStock(requiredAmount) {
                    fruit.subtractStock(requiredAmount)
                } else {
                    print("재고가 모자라요.")
                    return
                }
            }
        }
        print("\(juice.name()) 나왔습니다! 맛있게 드세요!")
    }
}
