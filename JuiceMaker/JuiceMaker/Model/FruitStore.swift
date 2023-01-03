//
//  JuiceMaker - FruitStore.swift
//  Created by 송준, Rowan. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    var fruitsStock = ["딸기":10, "망고":10, "바나나":10, "키위":10, "파인애플":10]
    
    func subtractInventory(fruit: String, number: Int) throws {
        guard let selectedStock = self.fruitsStock[fruit],
              selectedStock - number >= 0 else {
            throw stockError.outOfStock
        }
        
        fruitsStock[fruit] = selectedStock - number
    }
    
    func addInventory(fruit: String, number: Int) {
        if let selectedStock = self.fruitsStock[fruit] {
            fruitsStock[fruit] = selectedStock + number
        } else { // 품목 추가 
            fruitsStock[fruit] = number
        }
    }
    
    func checkStock(fruit: String) {
        if let stock = fruitsStock[fruit] {
            let resultMessage = "\(fruit)의 재고는 \(stock)개입니다."
            print(resultMessage)
        }
    }
}
