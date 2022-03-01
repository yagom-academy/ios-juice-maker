//
//  JuiceMaker - JuiceMaker.swift
//  Created by safari and Red. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    private var fruitStore = FruitStore.fruitStore
    
    enum Juice: String {
        case strawberryJuice = "딸기쥬스"
        case bananaJuice = "바나나쥬스"
        case pineappleJuice = "파인애플쥬스"
        case kiwiJuice = "키위쥬스"
        case mangoJuice = "망고쥬스"
        case strawberryAndBananaJuice = "딸바쥬스"
        case mangoAndKiwiJuice = "망키쥬스"
        
        var koreanName: String {
            return self.rawValue
        }
        
        var recipe: [(Fruit, Int)] {
            switch self {
            case .strawberryJuice:
                return [(.strawberry, 16)]
            case .bananaJuice:
                return [(.banana, 2)]
            case .pineappleJuice:
                return [(.pineapple, 2)]
            case .kiwiJuice:
                return [(.kiwi, 3)]
            case .mangoJuice:
                return [(.mango, 3)]
            case .strawberryAndBananaJuice:
                return [(.strawberry, 10), (.banana, 1)]
            case .mangoAndKiwiJuice:
                return [(.mango, 2), (.kiwi, 1)]
                
            }
        }
    }
    
    func takeOrder(_ juice: Juice) -> String {
        if ensureStock(of: juice) {
            make(juice)
            return "\(juice.koreanName) 나왔습니다! 맛있게 드세요!"
        } else {
            return "재료가 모자라요. 재고를 수정할까요?"
        }
    }
    
    private func ensureStock(of juice: Juice) -> Bool {
        var checkList: [Bool] = []
        for ingredient in juice.recipe {
            checkList.append(fruitStore.isEnoughStock(of: ingredient))
        }
        return checkList.allSatisfy{ (check: Bool) -> Bool in
            return check == true
        }
    }
    
    private func make(_ juice: Juice) {
        for ingredient in juice.recipe {
            let (neededFruit, neededStock) = ingredient
            fruitStore.changeStock(of: neededFruit, to: -neededStock)
            
        }
        print("\(juice) 나왔습니다.")
    }
}


