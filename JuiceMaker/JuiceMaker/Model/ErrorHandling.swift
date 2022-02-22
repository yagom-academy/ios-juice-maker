//
//  ErrorHandling.swift
//  JuiceMaker
//
//  Created by Marisol Mirim Kim on 2022/02/22.
//

import Foundation

enum ErrorHandling: Error {
    case outOfStock
    case wrongFormat
}

extension ErrorHandling: LocalizedError {
    var description: String {
        switch self {
        case .outOfStock:
            return "재고가 부족합니다."
        case .wrongFormat:
            return "잘못된 입력입니다."
        }
    }
}
