//
//  Error.swift
//  JuiceMaker
//
//  Created by Min Hyun on 2023/05/09.
//

import Foundation

enum StockError: Error {
    case outOfStock
    case fruitNotFound
    case unKnown

    var errorMessage: String {
        switch self {
        case .outOfStock:
            return "재고가 부족합니다."
        case .fruitNotFound:
            return "품목에 없는 과일입니다."
        case .unKnown:
            return "알 수 없는 오류입니다."
        }
    }
}
