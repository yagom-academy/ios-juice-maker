//
//  JuiceMakerError.swift
//  JuiceMaker
//
//  Created by 원툴, 두두 on 2022/02/22.
//

import Foundation

enum JuiceMakerError: Error {
    case outOfStock
    case invalidButton
}

extension JuiceMakerError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .outOfStock:
            return "재료가 모자라요. 재고를 수정할까요?"
        case .invalidButton:
            return "버튼을 잘못 누르셨습니다."
        }
    }
}
