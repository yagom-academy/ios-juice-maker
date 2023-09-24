//
//  JuiceMakerError.swift
//  Created by uemu, Toy.
//  Copyright © yagom academy. All rights reserved.
//
//

import Foundation

enum JuiceMakerError: LocalizedError {
    case outOfStock
    
    var errorDescription: String? {
        switch self {
        case .outOfStock:
            return "재고가 모자라요. 재고를 수정할까요?"
        }
    }
}

