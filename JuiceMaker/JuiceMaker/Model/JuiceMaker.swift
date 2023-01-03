//  JuiceMaker - JuiceMaker.swift
//  Created by 송준, Rowan. 
//  Copyright © yagom academy. All rights reserved.

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    let songroFruit = FruitStore()
    
    enum Recipe: String {
        case mango = "망고", pineapple = "파인애플", banana = "바나나", kiwi = "키위", strawberry = "딸기"
        case strawberryBanana = "딸바", mangoKiwi = "망고키위"
        
        var ingredients: [String:Int] {
            switch self {
            case .mango: return ["망고":3]
            case .pineapple: return ["파인애플":2]
            case .banana: return ["바나나":2]
            case .kiwi: return ["키위":3]
            case .strawberry: return ["딸기":16]
            case .strawberryBanana: return ["딸기":10, "바나나":1]
            case .mangoKiwi: return ["망고":2, "키위":1]
            }
        }
    }
    
    func make(juice: Recipe) {
        let ingredients = juice.ingredients
        
        do {
            for (key, value) in ingredients {
                try songroFruit.subtractInventory(fruit: key, number: value)
                songroFruit.checkStock(fruit: key)
            }
            print("주문하신 \(juice.rawValue)쥬스가 나왔습니다!")
        } catch stockError.outOfStock {
            print("재고가 부족합니다.")
        } catch {
            print(error)
        }
    }
}
