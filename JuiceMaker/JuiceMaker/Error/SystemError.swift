//
//  SystemError.swift
//  JuiceMaker
//
//  Created by 이승재 on 2021/10/22.
//

import Foundation

enum SystemError: Error {
    case invaildKey
}

extension SystemError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invaildKey:
            return "Dictionary의 Key가 유효하지 않습니다."
        }
    }
}

