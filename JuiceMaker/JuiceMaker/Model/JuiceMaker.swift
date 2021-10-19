//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    let fruitStore: FruitStore
    
    enum Juice {
        case strawberryJuice
        case bananaJuice
        case kiwiJuice
        case pineappleJuice
        case strawberryBananaJuice
        case mangoJuice
        case mangoKiwiJuice
    }
    
    func makeJuiceRecipe() {
        var juiceRecipe = [[FruitStore.Fruit: Int]]()
        juiceRecipe.append([.strawberry: 16])
        juiceRecipe.append([.banana: 2])
        juiceRecipe.append([.kiwi: 3])
        juiceRecipe.append([.pineapple: 2])
        juiceRecipe.append([.strawberry: 10 , .banana: 1])
        juiceRecipe.append([.mango: 3])
        juiceRecipe.append([.mango: 2, .kiwi: 3])
    }
}

