//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    enum Fruit: String {
        case strawberry = "딸기"
        case banana = "바나나"
        case pineapple = "파인애플"
        case kiwi = "키위"
        case mango = "망고"

    }

    private var stocks: [Fruit: Int]

    init(stocks: [Fruit : Int]) {
        self.stocks = stocks
    }

    func checkFruitStock() {

    }
}

