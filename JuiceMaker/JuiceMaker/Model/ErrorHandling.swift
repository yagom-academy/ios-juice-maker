//
//  ErrorHandling.swift
//  JuiceMaker
//
//  Created by 조영민 on 2021/10/19.
//

import Foundation

enum FruitStockError: LocalizedError {
    case outOfStock
    case invalidValue
    
    var errorDescription: String? {
        switch self {
        case .invalidValue:
            return "시스템 에러"
        case .outOfStock:
            return "재료가 소진되어 주스를 만들 수 없습니다."
        }
    }
//    var errorDescription: String? {
//        switch self {
//        case .outOfStock:
//            return "재료가 소진되어 주스를 만들 수 없습니다."
//        case .invalidValue:
//            return "시스템 에러"
//        }
//    }
}
