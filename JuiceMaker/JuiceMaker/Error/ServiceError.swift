//
//  ServiceError.swift
//  JuiceMaker
//
//  Created by Sunwoo on 2021/10/19.
//

import Foundation

enum ServiceError: Error {
    case notEnoughStock
}

extension ServiceError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .notEnoughStock:
            return "재고가 부족합니다."
        }
    }
}

