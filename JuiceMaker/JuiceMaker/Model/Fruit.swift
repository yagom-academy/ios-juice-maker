//
//  Fruit.swift
//  JuiceMaker
//
//  Created by 전민수 on 2022/04/25.
//

import Foundation

enum Fruit: String {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
}

enum stockError: Error {
    case invalidSelection
    case outOfStock
}

extension Fruit {
    var name: String {
        switch self {
        case .strawberry:
            return "strawberry"
        case .banana:
            return "banana"
        case .pineapple:
            return "pineapple"
        case .kiwi:
            return "kiwi"
        case .mango:
            return "mango"
        }
    }
}

extension stockError {
    var message: String {
        switch self {
        case .invalidSelection:
            return "해당 상품이 없습니다"
        case .outOfStock:
            return "재고가 부족합니다"
        }
    }
}

