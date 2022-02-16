//
//  StoreError.swift
//  JuiceMaker
//
//  Created by Oh Donggeon on 2022/02/16.
//

import Foundation

enum StoreError: Error {
    
    case notExistStuff(name: String)
    case outOfStock
    case notEnoughStock(remains: Int)
    
}

extension StoreError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .notExistStuff(name: let name):
            return NSLocalizedString("해당 \(name)이 존재하지 않습니다.",
                                     comment: "")
        case .outOfStock:
            return NSLocalizedString("재고가 없습니다.",
                                     comment: "")
        case .notEnoughStock(remains: let remains):
            return NSLocalizedString("남은 재고가 \(remains) 밖에 없습니다.",
                                     comment: "")
        }
    }
}
