//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입 
struct JuiceMaker {
    let warehouse: FruitStore
    
    func produce(kindOf menuName: JuiceMenu) -> JuiceMakingResult {
        let recipe = menuName.menuRecipe()
        var outcomeCreated: JuiceMakingResult
        
        do {
            try warehouse.changeForJuice(recipe)
            outcomeCreated =  .success(description: "\(menuName)\(JuiceMakingResult.completeOrderMessage)")
        } catch FruitStore.InventoryManagementError.outOfStock {
            outcomeCreated =  .failure(description: JuiceMakingResult.outOfStockMessage)
        } catch FruitStore.InventoryManagementError.cropThatDoNotExist {
            outcomeCreated =  .failure(description: JuiceMakingResult.cropThatDoNotExistMessage)
        } catch {
            outcomeCreated =  .failure(description: JuiceMakingResult.unknownErrorMessage)
        }
        return outcomeCreated
    }
    
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
        
        fileprivate func menuRecipe() -> [(requiredCrop: Fruit, requestedAmount: Int)] {
            var recipe: [(Fruit, Int)]
            
            switch self {
            case .strawberry:
                recipe = [(Fruit.strawberry, 16)]
            case .banana:
                recipe = [(Fruit.banana, 2)]
            case .kiwi:
                recipe = [(Fruit.kiwi, 3)]
            case .pineapple:
                recipe = [(Fruit.pineapple, 2)]
            case .mango:
                recipe = [(Fruit.mango, 3)]
            case .strawberryBanana:
                recipe = [(Fruit.strawberry, 10),(Fruit.banana, 1)]
            case .mangoKiwi:
                recipe = [(Fruit.mango, 2), (Fruit.kiwi, 1)]
            }
            return recipe
        }
    }
    
    enum JuiceMakingResult {
        fileprivate static let completeOrderMessage = " 나왔습니다! 맛있게 드세요!"
        fileprivate static let outOfStockMessage = "재료가 모자라요. 재고를 수정할까요?"
        fileprivate static let cropThatDoNotExistMessage = "해당 과일은 없습니다!"
        fileprivate static let unknownErrorMessage = "알 수 없는 문제로 쥬스를 만들지 못했습니다!"
        
        case success(description: String)
        case failure(description: String)
    }
}
