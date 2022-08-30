//
//  JuiceMaker - JuiceMaker.swift
//  Created by Mene, Dragon. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    let store = FruitStore(initialFruitAmount: 10)
    
    func makeJuice(of juice: Juice) {
        let recipe = juice.recipe
        
        for (key, _) in recipe {
            guard let fruitStock = store.inventory[key] else { return }
            guard let fruitRequiredNumber = recipe[key] else { return }
            
            if fruitStock < fruitRequiredNumber {
                print("재고가 부족합니다.")
                return
            }

            store.inventory[key] = fruitStock - fruitRequiredNumber
        }
        print("\(juice.rawValue) 쥬스를 만듭니다.")
    }
}
