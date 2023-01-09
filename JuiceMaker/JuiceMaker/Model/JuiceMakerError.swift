//
//  JuiceMaker - JuiceMakerError.swift
//  Created by Andrew, 혜모리 on 2023.01.02
//

import Foundation

enum JuiceMakerError: Error {
    case insufficientStock
    case noFruit
}

extension JuiceMakerError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .insufficientStock:
            return "재고가 모자라요. 재고를 수정할까요?"
        case .noFruit:
            return "스토어에서 취급하지 않는 과일입니다."
        }
    }
}
