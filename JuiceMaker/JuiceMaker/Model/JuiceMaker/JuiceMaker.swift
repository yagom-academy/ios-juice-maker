//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation
import UIKit

//MARK: 쥬스 메이커 타입
struct JuiceMaker: DrinkMakerable {
    private let fruitStore = FruitStore()
    
    func make(_ beverage: Drink) -> Result<JuiceType, StockError> {
        do{
            try fruitStore.consume(beverage.juice.requireIngredients())
            return .success(beverage.juice)
        } catch let stockError {
            return .failure(stockError as? StockError ?? .notEnoughIngredient)
        }
    }
    
    func count(_ fruit: Fruit) -> String {
        return String(fruitStore.count(fruit))
    }
}
