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
    
    static let notEnoughStockErrorMessage = "재료가 모자라요. 재고를 수정할까요?"
    static let notRegisteredFruitErrorMessage = "존재하지 않는 과일입니다."
    static let noRecipeErrorMessage = "레서피가 존재하지 않습니다."
    static let unkownErrorMessage = "알 수 없는 오류가 발생했습니다."
    
    static func getErrorMessage(error: JuiceMakingError) -> String {
        switch error {
        case JuiceMakingError.notEnoughStock:
            return JuiceMakingError.notEnoughStockErrorMessage
        case JuiceMakingError.notRegisteredFruit:
            return JuiceMakingError.notRegisteredFruitErrorMessage
        case JuiceMakingError.noRecipe:
            return JuiceMakingError.noRecipeErrorMessage
        default:
            return JuiceMakingError.unkownErrorMessage
        }
    }
}
