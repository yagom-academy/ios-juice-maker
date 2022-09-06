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

extension JuiceMakerError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .fruitAmountError:
            return "재료가 모자라요. 재고를 수정할까요?"
        case .fruitExistError:
            return "재료가 없어서 만들 수 없어요"
        }
    }
}
