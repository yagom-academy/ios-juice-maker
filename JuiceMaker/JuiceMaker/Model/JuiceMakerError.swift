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
            return "재고가 부족합니다."
        case .noFruit:
            return "스토어에서 취급하지 않는 과일입니다."
        }
    }
}
