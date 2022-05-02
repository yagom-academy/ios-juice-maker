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
    
    func make(_ beverage: Drink) -> Result<JuiceType, StockError> {
        do{
            try fruitStore.consume(beverage.juice.requireIngredients())
            return .success(beverage.juice)
        } catch let stockError {
            return .failure(stockError as? StockError ?? .notEnoughIngredient("재료가 모자라요. 재고를 수정할까요?"))
        }
    }
}
