//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation
import UIKit

//MARK: 쥬스 메이커 타입
struct JuiceMaker: DrinkMakerable {
    let fruitStore = FruitStore()
    
    func make(_ beverage: Drink) -> Result<Drink, StockError> {
        do{
            try fruitStore.consume(beverage.juice.requireIngredients())
            return .success(beverage)
        } catch let stockError {
            return .failure(.notEnoughIngredient)
        }
    }
}

