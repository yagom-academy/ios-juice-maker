//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    private var fruitStore: FruitStore
    
    init() {
        self.fruitStore = FruitStore()
        fruitStore.changeFruitQuantity(fruitName: "딸기", quanitity: 9)
    }
    
    func makeStrawberryJuice(amount: Int){
        var strawberryAmount = fruitStore.showFruitAmount(fruitName: "딸기")
        
        if(strawberryAmount < 16){
            print("과일의 재고가 부족하여 쥬스를 제조할 수 없습니다.")
        } else{
            strawberryAmount -= amount * 16
            print("\(amount) 개의 딸기쥬스를 만들었습니다.")
        }
    }
    
}
