//
//  JuiceMaker - JuiceMaker.swift
//  Created by EHD, Soll.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum juiceMakerError: Error {
    case outOfStock
    case invalidNumber
}

// 쥬스 메이커 타입
struct JuiceMaker {
    enum Menu: String {
        case strawberry = "딸기"
        case banana = "바나나"
        case kiwi = "키위"
        case pineapple = "파인애플"
        case strawberryBanana = "딸바"
        case mango = "망고"
        case mangoKiwi = "망키"
    }
    
    let fruitStore = FruitStore()
    
    func juiceRecipe(juiceMenu: Menu) -> [FruitStore.Fruit: UInt]{
        switch juiceMenu {
        case .strawberry:
            return [.strawberry: 16]
        case .banana:
            return [.banana: 2]
        case .kiwi:
            return [.kiwi: 3]
        case .pineapple:
            return [.pineapple: 2]
        case .strawberryBanana:
            return [.strawberry: 10, .banana: 1]
        case .mango:
            return [.mango: 3]
        case .mangoKiwi:
            return [.mango: 2, .kiwi: 1]
        }
    }
    
    func isJuiceAvailable(menu: Menu) throws  {
        let orderedJuiceRecipe = juiceRecipe(juiceMenu: menu)
        let fruitsWeNeed = Array(orderedJuiceRecipe.keys)
        
        for fruit in fruitsWeNeed {
            guard let necessaryFruitNumberForMenu = orderedJuiceRecipe[fruit],
                  let currentFruitNumberInStorage = fruitStore.storage[fruit]
            else { throw juiceMakerError.invalidNumber }
            
            if necessaryFruitNumberForMenu > currentFruitNumberInStorage {
                throw juiceMakerError.outOfStock
            }
        }
    }

    func makeJuice(menu: Menu) throws {
        let recipe = juiceRecipe(juiceMenu: menu)
        
        do {
            try isJuiceAvailable(menu: menu)
            for (fruit, count) in recipe {
                fruitStore.modifyStock(fruit: fruit, changes: -Int(count))
            }
        } catch juiceMakerError.outOfStock {
            throw juiceMakerError.outOfStock
        } catch juiceMakerError.invalidNumber {
            throw juiceMakerError.invalidNumber
        }
    }
}
