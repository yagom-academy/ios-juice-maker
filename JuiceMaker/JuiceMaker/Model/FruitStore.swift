//
//  JuiceMaker - FruitStore.swift
//  Created by 송준, Rowan. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    var fruitsStock = ["딸기":10, "망고":10, "바나나":10, "키위":10, "파인애플":10]
    
    func changeInventory(fruit: String, number: Int) throws {
        guard var selectedStock = self.fruitsStock[fruit], // 두근두근
              selectedStock > 0 else {
            throw stockError.outOfStock
        }
        selectedStock -= number
    }
    
    func checkStock(fruit: String) {
        let resultMessage = "\(fruit)의 재고는 \(fruitsStock[fruit])개입니다."
        print(resultMessage)
    }
}
