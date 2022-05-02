//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    private let fruitStore = FruitStore(initialAmount: 10)
    
    func takeOrder(_ fruitJuice: FruitJuice) -> (FruitJuice, Bool) {
        do {
            guard let completedFruitJuice = try fruitStore.make(fruitJuice) else {
                print("재고가 부족합니다.")
                return (fruitJuice, false)
            }
            print("\(completedFruitJuice)가 완성되었습니다.")
        } catch JuiceMakerError.invalidOrder {
            print("잘못된 음료 요청.")
        } catch {
            print(error)
        }
        return (fruitJuice, true)
    }
}
