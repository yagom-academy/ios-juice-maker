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
            return "과일의 재고가 부족하여 과일쥬스를 제조할수 없습니다."
        }
    }
}

