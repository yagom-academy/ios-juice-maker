//
//  JuiceMakingError.swift
//  JuiceMaker
//
//  Created by Vayne, 우롱차 on 2022/02/24.
//

import Foundation

enum JuiceMakingError: Error {
    case notEnoughStock
    case notRegisteredFruit
    case duplicatedFruit
    case noRecipe
    case unkownError
    
    static let notEnoughStockErrorMessage = "재고가 부족합니다."
    static let notRegisteredFruitErrorMessage = "존재하지 않는 과일입니다."
    static let noRecipeErrorMessage = "레서피가 존재하지 않습니다."
    static let unkownErrorMessage = "알 수 없는 오류가 발생했습니다."
    
    static func printErrorMessage(error: JuiceMakingError) {
        if error == JuiceMakingError.notEnoughStock {
            print(JuiceMakingError.notEnoughStockErrorMessage)
        } else if error == JuiceMakingError.notRegisteredFruit {
            print(JuiceMakingError.notRegisteredFruitErrorMessage)
            
        } else if error == JuiceMakingError.noRecipe {
            print(JuiceMakingError.noRecipeErrorMessage)
        } else {
            print(JuiceMakingError.unkownErrorMessage)
        }
    }
}
