//
//  JuiceMakerError.swift
//  JuiceMaker
//
//  Created by HyeJee Kim on 2022/02/15.
//

import Foundation

enum JuiceMakerError: Error {
    case notAvailable
}

extension JuiceMakerError {
    var errorDescription: String? {
        switch self {
        case .notAvailable:
            return "주문할 수 없는 쥬스입니다."
        }
    }
}
