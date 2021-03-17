//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum ErrorMessage: String {
    case notExistRecipe = "존재하지 않는 레시피입니다."
    case notEnoughStock = "재고가 부족합니다. 재고를 수정할까요!"
}

class JuiceMaker {
    let fruitStocks = FruitStock()
    let juiceRecipes = JuiceRecipe()
   
    func orderMakeJuice(targetJuice: ObjectIdentifier) {
        if juiceRecipes.canMake(targetRecipe: targetJuice, checkStocks: fruitStocks) {
            //  쥬스를 만들 수 있다
            makeJuice(targetJuice)
        } else {
            //  쥬스를 만들 수 없다
            
        }
    }
    
    func makeJuice(_ targetJuice: ObjectIdentifier) {
        juiceRecipes.useRecipe(targetRecipe: targetJuice, useStocks: fruitStocks)
    }
}
