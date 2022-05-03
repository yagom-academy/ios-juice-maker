//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    private let fruitStore: FruitStore = FruitStore(initialAmount: 10)
    
    func takeOrder(_ fruitJuice: FruitJuice) -> (FruitJuice, Bool) {
        do {
            guard try fruitStore.make(fruitJuice) != nil else {
                return (fruitJuice, false)
            }
        } catch JuiceMakerError.invalidOrder {
            print("잘못된 음료 요청.")
        } catch {
            print(error)
        }
        return (fruitJuice, true)
    }
    
    func requestCurrentStock() -> [Fruit:Int]? {
        return fruitStore.fruitsStock
    }
}
