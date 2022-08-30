//
//  OrderError.swift
//  JuiceMaker
//
//  Created by som, LJ on 2022/08/30.
//

import Foundation

enum OrderError: Error {
    case outOfStack
    case unknown
    
    var message: String {
        switch self {
        case .outOfStack:
            return "재고가 부족합니다."
        case .unknown:
            return "과일이 없습니다."
        }
    }
}
