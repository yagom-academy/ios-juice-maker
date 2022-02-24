//
//  ErrorHandling.swift
//  JuiceMaker
//
//  Created by Marisol Mirim Kim on 2022/02/22.
//

import Foundation

enum OrderError: Error {
    case outOfStock
    case unknownError
}

extension OrderError: LocalizedError {
    var description: String {
        switch self {
        case .outOfStock:
            return "재고가 부족합니다."
        case .unknownError:
            return "알 수 없는 에러입니다. 다시 시도하세요."
        }
    }
}
