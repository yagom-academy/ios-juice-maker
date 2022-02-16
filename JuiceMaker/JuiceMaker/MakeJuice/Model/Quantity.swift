//
//  Quantity.swift
//  JuiceMaker
//
//  Created by momo on 2022/02/16.
//

import Foundation

/// 양, 개수의 정보와 그에대한 연산의 역할이 있는 타입
///
/// 원시값 Int에 대하여 양의 정수만 유지하기 위해 존재함
struct Quantity: Equatable {
    
    private let quantity: Int
    
    init(_ value: Int) {
        guard value > 0 else {
            quantity = 0
            return
        }
        quantity = value
    }
    
    // 양을 화면에 표기하기 위함
    var text: String {
        return "\(quantity)"
    }
    
    static func + (first: Quantity, second: Quantity) -> Quantity {
        return Quantity(first.quantity + second.quantity)
    }
    
    static func - (first: Quantity, second: Quantity) throws -> Quantity {
        let result = first.quantity - second.quantity
        guard result >= 0 else {
            throw QuantityError.minusResult
        }
        return Quantity(result)
    }
    
    static func > (first: Quantity, second: Quantity) -> Bool {
        return first.quantity > second.quantity
    }
    
    static func < (first: Quantity, second: Quantity) -> Bool {
        return first.quantity < second.quantity
    }
}

extension Quantity {
    
    static let zero: Quantity = Quantity(0)
    
    enum QuantityError: Error {
        case minusResult
    }
}
