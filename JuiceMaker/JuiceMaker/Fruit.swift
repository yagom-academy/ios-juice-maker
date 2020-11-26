//
//  FruitJuice.swift
//  JuiceMaker
//
//  Created by Yeon on 2020/11/25.
//

enum FruitType: String {
    case strawberry = "딸기"
    case banana = "바나나"
    case pineapple = "파인애플"
    case kiwi = "키위"
    case mango = "망고"
    case none
}

class Fruit {
    let fruitType: FruitType
    private(set) var stock: Int
    
    init(fruitType: FruitType, stock: Int = 10){
        self.fruitType = fruitType
        self.stock = stock
    }

    func add(stock amount: Int) {
        self.stock += amount
    }
    
    func use(stock amount: Int) {
        self.stock -= amount
    }
    
    func isStockUsable(needAmount: Int) -> Bool {
        guard needAmount <= stock else {
           return false
        }
        return true
    }
}
