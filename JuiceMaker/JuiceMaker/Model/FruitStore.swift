//
//  JuiceMaker - FruitStore.swift
//  Created by 송준, Rowan. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    class Fruit {
        let name: String
        var stock = 10
        
        init(name: String, stock: Int = 10) {
            self.name = name
            self.stock = stock
        }
    }
    
    let strawberry = Fruit(name: "딸기")
    let banana = Fruit(name: "바나나")
    let kiwi = Fruit(name: "키위")
    let pineapple = Fruit(name: "파인애플")
    let mango = Fruit(name: "망고")
    
    func changeInventory(fruit: Fruit, number: Int) {
        fruit.stock -= number
    }
    
    func checkStock(fruit: Fruit) {
        let resultMessage = "\(fruit.name)의 재고는 \(fruit.stock)개입니다."
        print(resultMessage)
    }
}
