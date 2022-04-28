//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

//MARK: 쥬스 메이커 타입
struct JuiceMaker: DrinkMakerable {
    let fruitStore = FruitStore()
    
    func make(_ beverage: Drink) {
        do{
            try fruitStore.consume(beverage.juice.requireIngredients())
        } catch let error {
            print("에러: \(error)")
        }
    }
}

