//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Fruit: CaseIterable {
    case strawberry, banana, pineapple, kiwi, mango
}

enum Juice: String {
    case strawbana = "딸바"
    case mangki = "망키"
    case strawberry = "딸기"
    case banana = "바나나"
    case pineapple = "파인애플"
    case kiwi = "키위"
    case mango = "망고"
}

class JuiceMaker {
    private var stock: [Fruit: Int] = [:]
    private let recipes: [Juice: [Fruit: Int]] = [
        .strawbana: [.strawberry: 10, .banana: 1],
        .mangki: [.mango: 2, .kiwi: 1],
        .strawberry: [.strawberry: 16],
        .banana: [.banana: 2],
        .pineapple: [.pineapple: 2],
        .kiwi: [.kiwi: 3],
        .mango: [.mango: 3],
    ]
    
    init(stockCount: Int) {
        for fruit in Fruit.allCases {
            stock[fruit] = stockCount
        }
    }
    
    func make(juice: Juice) {
        guard let ingredients = recipes[juice] else {
            print("만들 수 없는 쥬스입니다.")
            return
        }
        
        if isEnough(ingredients: ingredients) {
            for (fruit, count) in ingredients {
                guard let stockCount = stock[fruit] else { return }
                stock[fruit] = stockCount - count
            }
            print("\(juice.rawValue) 쥬스 나왔습니다! 맛있게 드세요!")
        } else {
            print("재료가 모자랍니다.")
        }
    }
    
    func fillUpStock(of fruit: Fruit, count: Int) {
        guard let stockCount = stock[fruit] else {
            print("재고 목록에 없는 과일입니다")
            return
        }
        stock[fruit] = stockCount + count
    }
    
    func checkStock(of fruit: Fruit) -> Int {
        return stock[fruit] ?? 0
    }
    
    private func isEnough(ingredients: [Fruit: Int]) -> Bool {
        for (fruit, count) in ingredients {
            if checkStock(of: fruit) < count { return false }
        }
        
        return true
    }
}

let maker = JuiceMaker(stockCount: 10)
