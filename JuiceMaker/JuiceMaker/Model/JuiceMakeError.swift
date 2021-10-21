//
//  JuiceMakeError.swift
//  JuiceMaker
//
//  Created by Sunwoo on 2021/10/19.
//

import Foundation

enum JuiceMakeError: Error {
    case invaildKey
    case notEnoughStock
}

extension JuiceMakeError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invaildKey:
            return "Dictionary의 Key가 유효하지 않습니다."
        case .notEnoughStock:
            return "재고가 부족합니다."
        }
    }
}

