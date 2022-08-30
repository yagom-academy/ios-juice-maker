//
//  Error.swift
//  JuiceMaker
//
//  Created by stone, jpush.
//

import Foundation

enum JuiceMakerError: Error {
    case fruitAmountError
    case fruitExistError
}

extension JuiceMakerError: LocalizedError{
    var errorDescription: String? {
        switch self {
        case .fruitAmountError:
            return "과일 재고가 부족합니다."
        case .fruitExistError:
            return "과일이 존재하지 않습니다."
        }
    }
}
