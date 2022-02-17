//
//  JuiceMakerError.swift
//  JuiceMaker
//
//  Created by Yoojin Park on 2022/02/17.
//

import Foundation

enum JuiceMakerError: Error {
    case outOfStock
}

extension JuiceMakerError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .outOfStock:
            return "재료가 모자라요. 재고를 수정할까요?"
        }
    }
}
