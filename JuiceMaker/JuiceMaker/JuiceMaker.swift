//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum ErrorMessage: String {
    case notExistRecipe = "존재하지 않는 레시피입니다."
    case notEnoughStock = "재고가 부족합니다. 재고를 수정할까요?"
    case completeMakeJuice = "쥬스가 완성됐습니다. 맛있게 드세요!"
}

class JuiceMaker {
    let fruitStocks = FruitStock()
    let juiceRecipes = JuiceRecipe()
   
    func order(juice: ObjectIdentifier) -> ErrorMessage {
        if juiceRecipes.canMake(juice, fruitStocks) {
            make(juice)
            return .completeMakeJuice
        } else {
            return .notEnoughStock
        }
    }
    
    func make(_ juice: ObjectIdentifier) {
        juiceRecipes.useRecipe(juice, fruitStocks)
    }
}
