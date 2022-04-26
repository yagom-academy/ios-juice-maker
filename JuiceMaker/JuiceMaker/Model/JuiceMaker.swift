//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    enum Menu: String {
           case strawberry = "딸기"
           case banana = "바나나"
           case kiwi = "키위"
       }
       
       let fruitStore: FruitStore
       
       init(fruitStore: FruitStore) {
           self.fruitStore = fruitStore
       }
       
       func makeJuice(juice: Menu) throws {
           let recipe = chooseRecipe(of: juice)
           
           fruitStore.checkFruitStock()
           
       }
       
    private func chooseRecipe(of juice: Menu) -> FruitStore.Juice {
           switch juice {
           case .strawberry:
               return [Menu.strawberry: -16]

           case .banana:
               <#code#>
           case .kiwi:
               <#code#>
           }
    }
}
