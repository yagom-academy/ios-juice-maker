//
//  JuiceMakerError.swift
//  JuiceMaker
//
//  Created by Harry, kokkilE.
//

enum JuiceMakerError: Error {
    case outOfStock
    case nonExistentFruit
    
    var errorMessage: String {
        switch self {
        case .outOfStock:
            return "재고가 없습니다."
        case .nonExistentFruit:
            return "없는 과일 입니다."
        }
    }
}
