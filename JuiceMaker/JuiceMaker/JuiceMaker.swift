//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

class Fruit {
    private(set) var fruitName: String
    private(set) var fruitAmount: Int
    
    init(name: String,amount: Int) {
        self.fruitName = name
        self.fruitAmount = amount
    }
    
    internal func stockedFruit() -> Int {
        return self.fruitAmount
    }
    
    internal func addfruit() {
        self.fruitAmount += 1
    }
    
    internal func reducefruit(amount: Int) {
        self.fruitAmount -= amount
    }
}

enum FruitsJuice {
    case strawberryJuice, bananaJuice, pineappleJuice, kiwiJuice, mangoJuice, strawberryBananaJuice, mangoKiwiJuice
}

class JuiceMaker {
    private var strawberry = Fruit(name: "딸기", amount: 10)
    private var banana = Fruit(name: "바나나", amount: 10)
    private var pineapple = Fruit(name: "파일애플", amount: 10)
    private var kiwi = Fruit(name: "키위", amount: 10)
    private var mango = Fruit(name: "망고", amount: 10)
    private var fruitStock: [String : Int] = [:]
    
    // 과일 재고 확인
    internal func remainedFruitsStock() -> [String : Int]{
        self.fruitStock =
            [
                strawberry.fruitName: strawberry.fruitAmount,
                banana.fruitName: banana.fruitAmount,
                pineapple.fruitName: pineapple.fruitAmount,
                kiwi.fruitName: kiwi.fruitAmount,
                mango.fruitName: mango.fruitAmount]
        
        return fruitStock
    }
    
    // 쥬스 제조
    func produceFruitsJuice(juice: FruitsJuice) {
        switch juice {
        case .strawberryJuice:
            strawberry.reducefruit(amount: 16)
        case .bananaJuice:
            banana.reducefruit(amount: 2)
        case .pineappleJuice:
            pineapple.reducefruit(amount: 2)
        case .kiwiJuice:
            kiwi.reducefruit(amount: 3)
        case .mangoJuice:
            mango.reducefruit(amount: 3)
        case .mangoKiwiJuice:
            mango.reducefruit(amount: 2)
            kiwi.reducefruit(amount: 1)
        case .strawberryBananaJuice:
            strawberry.reducefruit(amount: 10)
            banana.reducefruit(amount: 1)
        }
    }
    
}

