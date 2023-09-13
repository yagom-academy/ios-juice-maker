//
//  JuiceMaker - JuiceMaker.swift
//  Created by uemu, Toy.
//  Copyright © yagom academy. All rights reserved.
//

// 쥬스 메이커 타입
struct JuiceMaker {
    private let fruitStore = FruitStore.shared
    
     func manufactureFruitJuice(in fruitJuice: FruitJuice) {
         do {
             try fruitStore.reduceFruitQuantity(in: fruitJuice)
         } catch {
             print("과일의 재고가 부족하여 과일쥬스를 제조할수 없습니다.")
         }
    }
}
