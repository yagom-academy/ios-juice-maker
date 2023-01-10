//
//  Error.swift
//  JuiceMaker
//
//  Created by riji, kaki on 2023/01/04.
//

enum JuiceMakerError: Error {
    case outOfStock
    case fruitError
    
    var message: String {
        switch self {
        case .outOfStock:
            return "재고가 부족합니다."
        case .fruitError:
            return "과일 선택 오류입니다."
        }
    }
}
