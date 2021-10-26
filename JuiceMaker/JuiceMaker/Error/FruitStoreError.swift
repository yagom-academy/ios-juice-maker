//
//  FruitStoreError.swift
//  JuiceMaker
//
//  Created by 박병호 on 2021/10/21.
//

import UIKit

enum FruitStoreError: Error {
    case stockShortage
    case stockDataMissing
}

extension FruitStoreError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .stockShortage:
            return "재료가 모자라요. 재고를 수정할까요?"
        case .stockDataMissing:
            return "재고 정보가 없습니다."
        }
    }
}
