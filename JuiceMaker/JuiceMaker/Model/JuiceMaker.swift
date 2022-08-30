//
//  JuiceMaker - JuiceMaker.swift
//  Created by Mene, Dragon. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    let store = FruitStore(initialFruitAmount: 10)
    
    func checkRecipe(of juice: Juice) -> [Fruit: Int] {
        switch juice {
        case .strawBerry:
            return [.strawBerry: 16]
        case .banana:
            return [.banana: 2]
        case .pineApple:
            return [.pineApple: 2]
        case .kiwi:
            return [.kiwi: 3]
        case .mango:
            return [.mango: 3]
        case .strawBerryBanana:
            return [.strawBerry: 10, .banana: 1]
        case .mangoKiwi:
            return [.mango: 2, .kiwi: 1]
        }
    }
    
    func makeJuice(of juice: Juice) {
        let recipe = checkRecipe(of: juice)
        
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
