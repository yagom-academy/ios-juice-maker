//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Juice: String {
    case 딸기쥬스 = "{\"Strawberry\":16}"
    case 바나나쥬스 = "{\"Banana\":2}"
    case 키위쥬스 = "{\"Kiwi\":3}"
    case 파인애플쥬스 = "{\"Pineapple\":2}"
    case 딸바쥬스 = "{\"Strawberry\":10},{\"Banana\":1}"
    case 망고쥬스 = "{\"Mango\":3}"
    case 망고키위쥬스 = "{\"Mango\":2},{\"Kiwi\":1}"
}

class JuiceMaker {
    private let stockOfFruit = StockOfFruit()

    func makeJuice(juice: Juice) {

    }
    
    func necessaryFruit(juice: Juice) -> [String:Int] {
        var necessaryFruit = [String:Int]()
        return necessaryFruit
    }
    
    func checkEnough(_ juice: Juice, _ fruitInfo: [String:Int]) -> Bool {
        return false
    }
}
