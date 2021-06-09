//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    enum JuiceRecipe: CaseIterable {
           case strawberryJuice
           case bananaJuice
           case kiwiJuice
           case mangoJuice
           case pineappleJuice

           case strawberryBananaJuice
           case mangoKiwiJuice
           
           var recipeIngredients: [Fruit: Int] {
               switch self {
               
               case .strawberryJuice:
                   return [.strawberry: 16]
                   
               case .bananaJuice:
                   return [.banana: 2]
                   
               case .kiwiJuice:
                   return [.kiwi: 3]
                   
               case .mangoJuice:
                   return [.mango: 3]
                   
               case .pineappleJuice:
                   return [.pineapple: 2]
                   
               case .strawberryBananaJuice:
                   return [.strawberry: 10, .banana: 1]
                   
               case .mangoKiwiJuice:
                   return [.mango: 2, .kiwi: 1]
               }
           }
       }
    
    let fruitstore = FruitStore()
}
