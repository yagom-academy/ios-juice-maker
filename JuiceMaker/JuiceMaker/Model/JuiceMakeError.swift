//
//  JuiceMaker - Fruit.swift
//  Created by 릴라, 세홍, 무리 on 2023/01/02
//  Copyright © yagom academy. All rights reserved.
//

enum JuiceMakeError: Error {
    case invalidError
    case outOfStock
    
    var errorMessage: String {
        switch self {
        case .invalidError:
            return "잘못된 입력입니다."
        case .outOfStock:
            return "재고가 부족합니다."
        }
    }
}
