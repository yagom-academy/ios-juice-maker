//  JuiceMaker - JuiceMaker.swift
//  Created by 송준, Rowan. 
//  Copyright © yagom academy. All rights reserved.

struct JuiceMaker {
    private let fruitStorage = FruitStore()
    
    enum Juice: String {
        case mango = "망고쥬스", pineapple = "파인애플쥬스", banana = "바나나쥬스", kiwi = "키위쥬스", strawberry = "딸기쥬스"
        case strawberryBanana = "딸바쥬스", mangoKiwi = "망고키위쥬스"
        
        var ingredients: [Fruits: Int] {
            switch self {
            case .mango: return [.mango: 3]
            case .pineapple: return [.pineapple: 2]
            case .banana: return [.banana: 2]
            case .kiwi: return [.kiwi: 3]
            case .strawberry: return [.strawberry: 16]
            case .strawberryBanana: return [.strawberry: 10, .banana: 1]
            case .mangoKiwi: return [.mango: 2, .kiwi: 1]
            }
        }
    }
    
    func make(juice: Juice) {
        let ingredients = juice.ingredients
        
        do {
            for (key, value) in ingredients {
                try fruitStorage.subtractStock(of: key, count: value)
                fruitStorage.checkStock(of: key)
            }
            print("주문하신 \(juice.rawValue)가 나왔습니다!")
        } catch StockError.outOfStock {
            print("재고가 부족합니다.")
        } catch {
            print(error)
        }
    }
}
