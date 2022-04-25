//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    
    let fruitStore: FruitStore = FruitStore(quantity: 10)
    
    func makeJuice(what juiceMenu: Menu) {
        for (juice, fruitCount) in juiceMenu.returnRecipe(){
            fruitStore.subtractQuantity(fruit: juice, by: fruitCount)
        }
    }
}
