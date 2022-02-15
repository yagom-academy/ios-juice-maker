//
//  Quantity.swift
//  JuiceMaker
//
//  Created by momo on 2022/02/16.
//

import Foundation

struct Quantity: Equatable {
    
    let quantity: Int
    
    init(_ value: Int) {
        guard value > 0 else {
            quantity = 0
            return
        }
        quantity = value
    }
    
    static func + (first: Quantity, second: Quantity) -> Quantity {
        return Quantity(first.quantity + second.quantity)
    }
    
    static func - (first: Quantity, second: Quantity) throws -> Quantity {
        let result = first.quantity - second.quantity
        guard result >= 0 else {
            throw QuantityError.minusResultError
        }
        return Quantity(result)
    }
    
}

extension Quantity {
    
    static let ZERO: Quantity = Quantity(0)
    
    enum QuantityError: Error {
        case minusResultError
    }
    
}
