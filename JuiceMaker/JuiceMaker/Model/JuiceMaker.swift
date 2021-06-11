//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    enum JuiceMenu: String, CustomStringConvertible {
        case strawberry = "딸기 쥬스"
        case banana = "바나나 쥬스"
        case pineapple = "파인애플 쥬스"
        case kiwi = "키위 쥬스"
        case mango = "망고 쥬스"
        case strawberryBanana = "딸바 쥬스"
        case mangoKiwi = "망키 쥬스"
        
        var description: String {
            self.rawValue
        }
        
        fileprivate func receiveRecipes() -> [(requiredFruit: Fruit, requestedAmount: Int)] {
            var recipe: [(Fruit, Int)]
            
            switch self {
            case .strawberry:
                recipe = [(.strawberry, 16)]
            case .banana:
                recipe = [(.banana, 2)]
            case .kiwi:
                recipe = [(.kiwi, 3)]
            case .pineapple:
                recipe = [(.pineapple, 2)]
            case .mango:
                recipe = [(.mango, 3)]
            case .strawberryBanana:
                recipe = [(.strawberry, 10), (.banana, 1)]
            case .mangoKiwi:
                recipe = [(.mango, 2), (.kiwi, 1)]
            }
            return recipe
        }
    }
    
    enum JuiceMakingResult {
        fileprivate static let completeOrderMessage = " 나왔습니다! 맛있게 드세요!"
        fileprivate static let unknownErrorMessage = "알 수 없는 문제로 쥬스를 만들지 못했습니다!"

        case success(message: String)
        case failure(description: String)
    }
    
    let fruitStore: FruitStore
    
    func produce(kindOf menuName: JuiceMenu) -> JuiceMakingResult {
        let recipes = menuName.receiveRecipes()
        var outcomeCreated: JuiceMakingResult
        
        do {
            try fruitStore.consumeStocks(recipes)
            outcomeCreated = .success(message: "\(menuName)\(JuiceMakingResult.completeOrderMessage)")
        } catch FruitStore.InventoryManagementError.inventoryError(let message) {
            outcomeCreated = .failure(description: message)
        } catch {
            outcomeCreated = .failure(description: JuiceMakingResult.unknownErrorMessage)
        }
        return outcomeCreated
    }
}
