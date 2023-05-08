//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Fruit {
    var name: String
    var stock: Int
}

// 과일 저장소 타입
class FruitStore {
    private var strawberry = Fruit(name: "딸기", stock: 10)
    private var banana = Fruit(name: "바나나", stock: 10)
    private var pineapple = Fruit(name: "파인애플", stock: 10)
    private var kiwi = Fruit(name: "키위", stock: 10)
    private var mango = Fruit(name: "망고", stock: 10)
    
    var strawberryStock: Int {
        return strawberry.stock
    }
    var bananaStock: Int {
        return banana.stock
    }
    var pineappleStock: Int {
        return pineapple.stock
    }
    var kiwiStock: Int {
        return kiwi.stock
    }
    var mangoStock: Int {
        return mango.stock
    }

    func changeStock(_ fruit: String, to number: Int) throws {
        switch fruit {
        case "딸기":
            strawberry.stock = number
        case "바나나":
            banana.stock = number
        case "파인애플":
            pineapple.stock = number
        case "키위":
            kiwi.stock = number
        case "망코":
            mango.stock = number
        default:
            throw InputError.invalidInputError
        }
    }
}

feat: 입력 함수 삭제 및 Fruit 구조체 생성, 재고 변수 생성, 재고 변경 함수 생성
