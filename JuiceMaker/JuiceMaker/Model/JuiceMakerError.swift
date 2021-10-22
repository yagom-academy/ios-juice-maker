//
//  JuiceMakerError.swift
//  JuiceMaker
//
//  Created by 권나영 on 2021/10/22.
//

import Foundation

enum JuiceMakerError: Error, CustomStringConvertible {
    case outOfStock(String)
    case invalidNumber
    
    var description: String {
        switch self {
        case let .outOfStock(fruit):
            return "\(fruit)의 재고가 부족합니다"
        case .invalidNumber:
            return "유효하지 않은 숫자입니다"
        }
    }
}
