//
//  JuiceOrderError.swift
//  JuiceMaker
//
//  Created by Jae-hoon Sim on 2021/10/25.
//

import Foundation

enum JuiceOrderError: Error {
    case invalidJuiceOrder
    case undefined
}

extension JuiceOrderError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidJuiceOrder:
            return "주문이 유효하지 않습니다"
        case .undefined:
            return "일시적인 오류입니다. 다시 시도해 주세요."
        }
    }
}
