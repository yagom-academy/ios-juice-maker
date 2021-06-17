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
    
    func defaultJuiceRecipe(juiceMenu: Menu) -> [FruitStore.Fruit: UInt]{
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
    
    func isJuiceAvailable(menu: Menu) throws -> Bool {
        var isIngredientRemain: Bool = true
        let orderedJuiceRecipe = defaultJuiceRecipe(juiceMenu: menu)
        let neededIngredient = Array(orderedJuiceRecipe.keys)
        
        for i in 0..<orderedJuiceRecipe.count {
            guard let necessaryFruitNumberForMenu = orderedJuiceRecipe[neededIngredient[i]],
                  let currentRemainedFruitNumber = fruitStore.storage[neededIngredient[i]]
            else {
                print("invalidNumber from isJuiceAvailable()")
                throw juiceMakerError.invalidNumber
            }
            
            if necessaryFruitNumberForMenu > currentRemainedFruitNumber {
                isIngredientRemain = false
                print("Out of stock from isJuiceAvailable()")
                throw juiceMakerError.outOfStock
            }
        }
        return isIngredientRemain
    }
    
    func makeJuice(menu: Menu) throws {
        let userMenuRecipe = defaultJuiceRecipe(juiceMenu: menu)
        
        do {
            try isJuiceAvailable(menu: menu)
            for (fruit, count) in userMenuRecipe {
                fruitStore.modifyStock(fruit: fruit,
                                       changes: -Int(count))
                
            }
        } catch juiceMakerError.outOfStock {
            print("Out of stock from makeJuice()")
            throw juiceMakerError.outOfStock
        } catch juiceMakerError.invalidNumber {
            throw juiceMakerError.invalidNumber
        }
    }
}
