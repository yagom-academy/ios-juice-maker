//
//  JuiceMaker - JuiceMaker.swift
//  Created by 써니쿠키, SummerCat
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    let fruitStore = FruitStore()
    
    enum Juice {
        case strawberryJuice
        case bananaJuice
        case kiwiJuice
        case pineappleJuice
        case strawberryBananaJuice
        case mangoJuice
        case mangoKiwiJuice
        
        var juiceName: String {
            switch self {
            case .strawberryJuice:
                return "딸기쥬스"
            case .bananaJuice:
                return "바나나쥬스"
            case .kiwiJuice:
                return "키위쥬스"
            case .pineappleJuice:
                return "파인애플쥬스"
            case .strawberryBananaJuice:
                return "딸바쥬스"
            case .mangoJuice:
                return "망고쥬스"
            case .mangoKiwiJuice:
                return "망키쥬스"
            }
        }
        
        var recipe: Dictionary<FruitStore.Fruit, Int> {
            switch self {
            case .strawberryJuice:
                return [.strawberry: 16]
            case .bananaJuice:
                return [.banana: 2]
            case .kiwiJuice:
                return [.kiwi: 3]
            case .pineappleJuice:
                return [.pineapple: 2]
            case .strawberryBananaJuice:
                return [.strawberry: 10, .banana: 1]
            case .mangoJuice:
                return [.mango: 3]
            case .mangoKiwiJuice:
                return [.mango: 2, .kiwi: 1]
            }
        }
    }
    
    func makeJuice(_ juice: Juice, total: Int) {
        do {
            try checkStockOf(juice, total: total)
        } catch let error as JuiceMakerError {
            print(error.errorDescription)
            return
        } catch {
            print("\(error)")
            return
        }
        
        let recipe = juice.recipe
        
        for (ingredient, quantity) in recipe {
            fruitStore.changeStockOf(fruit: ingredient, by: -(quantity * total))
        }
        
        print("\(juice.juiceName) \(total)잔 완성")
    }
    
    private func checkStockOf(_ juice: Juice, total: Int) throws {
        let recipe = juice.recipe
        
        for (ingredient, quantity) in recipe {
            guard let currentStock = fruitStore.fruitStock[ingredient] else {
                return
            }
            
            guard currentStock >= quantity * total else {
                throw JuiceMakerError.stockShortage
            }
        }
    }
}
