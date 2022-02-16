//
//  Errors.swift
//  JuiceMaker
//
//  Created by Haeseok Lee on 2022/02/16.
//

import Foundation

enum JuiceMakerStateError: Error {
    case unknown
    case noState
    case outOfStock
}

extension JuiceMakerStateError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .unknown:
            return "알 수 없는 에러입니다."
        case .noState:
            return "현재 입력 받은 상태가 없어요. 어떤 주스를 제조할지 알려주세요!"
        case .outOfStock:
            return "재고가 모자라요. 재고를 수정할까요?"
        }
    }
}
