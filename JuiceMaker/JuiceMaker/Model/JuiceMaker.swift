//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입 
struct JuiceMaker {
    enum Menu {
        case strawberry
        case banana
        case kiwi
        case pineapple
        case strawberryBanana
        case mango
        case mangoKiwi
    }
    
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
    
    func isJuiceAvailable(menu: Menu) -> Bool {
        var isIngredientRemain: Bool = true
        let orderedJuiceRecipe = defaultJuiceRecipe(juiceMenu: menu)
        
        var neededIngredient = [FruitStore.Fruit]()
        var neededIngredientCount = [UInt]()
        
        for (fruit, count) in orderedJuiceRecipe {
            neededIngredient.append(fruit)
            neededIngredientCount.append(count)
        }
        
        for i in 0..<orderedJuiceRecipe.count {
            guard let recipeNumber = orderedJuiceRecipe[neededIngredient[i]],
                  let storageNumber = FruitStore.storage[neededIngredient[i]]
            else {
                return false
            }
            
            if recipeNumber <= storageNumber {
                continue
            } else {
                isIngredientRemain = false
            }
        }
        return isIngredientRemain
    }
    
    func makeJuice(menu: Menu) {
        let fruitStore = FruitStore()
        let userMenuRecipe = defaultJuiceRecipe(juiceMenu: menu)
        
        if isJuiceAvailable(menu: menu) {
            for (fruit, count) in userMenuRecipe {
                fruitStore.modifyStock(fruit: fruit,
                                       changes: -Int(count))
            }
        } else {
            print("재고 부족")
        }
    }
}
