//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

/// 쥬스 메이커 타입 
class Fruit {
    var fruitName: String
    var fruitAmount: Int
    
    init(specie: String, amount: Int) {
        self.fruitName = specie
        self.fruitAmount = amount
    }
}

class FruitsStock {
    private(set) var strawberry = Fruit(specie: "딸기", amount: 10)
    private(set) var banana = Fruit(specie: "바나나", amount: 10)
    private(set) var pineapple = Fruit(specie: "파일애플", amount: 10)
    private(set) var kiwi = Fruit(specie: "키위", amount: 10)
    private(set) var mango = Fruit(specie: "망고", amount: 10)
}

enum FruitsJuice {
    case strawberryJuice, bananaJuice, pineappleJuice, kiwiJuice, mangoJuice, strawberryBananaJuice, mangoKiwiJuice
}

class JuiceMaker {
    var fruitStock = FruitsStock()
    
    // 과일 재고 확인
    func remainedFruitsStock() -> [String : Int] {
        let fruitsStockList: [String : Int] =
            [
                fruitStock.strawberry.fruitName: fruitStock.strawberry.fruitAmount,
                fruitStock.banana.fruitName: fruitStock.banana.fruitAmount,
                fruitStock.pineapple.fruitName: fruitStock.pineapple.fruitAmount,
                fruitStock.kiwi.fruitName: fruitStock.kiwi.fruitAmount,
                fruitStock.mango.fruitName: fruitStock.mango.fruitAmount
            ]
        return fruitsStockList
    }
    
    // 과일 재고 줄이기
    func reducedFruitsStock(name: Fruit, amount: Int) {
        name.fruitAmount -= amount
    }
        
    // 쥬스 제조
    func produceFruitsJuice(juice: FruitsJuice) {
        switch juice {
        case .strawberryJuice:
            reducedFruitsStock(name: fruitStock.strawberry, amount: 16)
        case .bananaJuice:
            reducedFruitsStock(name: fruitStock.banana, amount: 2)
        case .pineappleJuice:
            reducedFruitsStock(name: fruitStock.pineapple, amount: 2)
        case .kiwiJuice:
            reducedFruitsStock(name: fruitStock.kiwi, amount: 3)
        case .mangoJuice:
            reducedFruitsStock(name: fruitStock.mango, amount: 3)
        case .mangoKiwiJuice:
            reducedFruitsStock(name: fruitStock.mango, amount: 2)
            reducedFruitsStock(name: fruitStock.kiwi, amount: 1)
        case .strawberryBananaJuice:
            reducedFruitsStock(name: fruitStock.strawberry, amount: 10)
            reducedFruitsStock(name: fruitStock.banana, amount: 1)
        }
    }
    
    // STEP-3 재고 페이지에서 과일 재고 추가
    func addToFruitsStock(name: Fruit) {
        let stock = FruitsStock()
        
        switch name.fruitName {
        case "딸기":
            stock.strawberry.fruitAmount += 1
        case "바나나":
            stock.banana.fruitAmount += 1
        case "파인애플":
            stock.pineapple.fruitAmount += 1
        case "키위":
            stock.kiwi.fruitAmount += 1
        case "망고":
            stock.mango.fruitAmount += 1
        default:
            print("과일을 찾을 수 없습니다.")
        }
    }
}
