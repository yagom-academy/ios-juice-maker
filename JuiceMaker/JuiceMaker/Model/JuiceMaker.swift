//  JuiceMaker - JuiceMaker.swift
//  Created by 송준, Rowan. 
//  Copyright © yagom academy. All rights reserved.

struct JuiceMaker {
    let songroFruit = FruitStore()
    
    enum Recipe: String {
        case mango = "망고", pineapple = "파인애플", banana = "바나나", kiwi = "키위", strawberry = "딸기"
        case strawberryBanana = "딸바", mangoKiwi = "망고키위"
        
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
    
    func make(juice: Recipe) {
        let ingredients = juice.ingredients
        
        do {
            for (key, value) in ingredients {
                try songroFruit.subtractStock(of: key, count: value)
                songroFruit.checkStock(fruit: key)
            }
            print("주문하신 \(juice.rawValue)쥬스가 나왔습니다!")
        } catch StockError.outOfStock {
            print("재고가 부족합니다.")
        } catch {
            print(error)
        }
    }
}
