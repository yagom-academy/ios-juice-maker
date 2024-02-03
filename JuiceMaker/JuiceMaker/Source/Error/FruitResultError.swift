//
//  FruitResultType.swift
//  JuiceMaker
//
//  Created by HAMZZI, Danny on 1/24/24.
//

import Foundation

enum FruitResultError: Error {
    case outOfStockError
    case unexpectedError

    var message: String {
        switch self {
        case .outOfStockError:
            return "재고가 부족합니다. 재고를 채우시겠습니까?"
        case .unexpectedError:
            return "알 수 없는 에러가 발생하였습니다. 관리자에게 문의하여 주세요"
        }
    }
}
