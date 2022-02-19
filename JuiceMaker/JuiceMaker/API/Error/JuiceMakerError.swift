//
//  JuiceMakerError.swift
//  JuiceMaker
//
//  Created by 박형석 on 2022/02/15.
//

import Foundation

enum JuiceMakerError: Error {
    case outOfStock
    case unknown
}

extension JuiceMakerError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .outOfStock:
            return "재료가 모자라요. 재고를 수정할까요?"
        case .unknown:
            return "알 수 없는 에러"
        }
    }
}
