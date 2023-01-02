//
//  JuiceMakeError.swift
//  JuiceMaker
//
//  Created by 김성준 on 2023/01/02.
//

enum JuiceMakeError: Error {
    case invalidError
    case outOfStock
    
    var errorMessage: String {
        switch self {
        case .invalidError:
            return "잘못된 입력입니다."
        case .outOfStock:
            return "재고가 부족합니다."
        }
    }
}
