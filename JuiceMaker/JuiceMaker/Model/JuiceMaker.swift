//  JuiceMaker - JuiceMaker.swift
//  Created by 송준, Rowan.
//  Copyright © yagom academy. All rights reserved.

struct JuiceMaker {
    let fruitStorage = FruitStore.shared
    
    enum Juice {
        case mango, pineapple, banana, kiwi, strawberry
        case strawberryBanana, mangoKiwi
        
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
        
        var name: String {
            switch self {
            case .mango: return "망고쥬스"
            case .pineapple: return "파인애플쥬스"
            case .banana: return "바나나쥬스"
            case .kiwi: return "키위쥬스"
            case .strawberry: return "딸기쥬스"
            case .strawberryBanana: return "딸바쥬스"
            case .mangoKiwi: return "망키쥬스"
            }
        }
    }
    
    func make(juice: Juice) throws {
        let ingredients = juice.ingredients
        
        for (key, value) in ingredients {
            guard fruitStorage.isEnoughStock(of: key, count: value) else {
                throw StockError.outOfStock
            }
        }

        for (key, value) in ingredients {
            fruitStorage.subtractStock(of: key, count: value)
        
        print("주문하신 \(juice.name)가 나왔습니다!")
        }
    }
}
