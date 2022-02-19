//
//  Number.swift
//  JuiceMaker
//
//  Created by 박형석 on 2022/02/16.
//

import Foundation

struct Number {
    private(set) var value: Int
    
    init(_ value: Int = 10) {
        self.value = value
    }
    
    mutating func increase() {
        self.value += 1
    }
    
    mutating func increase(_ amount: Number) throws {
        guard amount.value >= 0 else {
            throw NumberError.isNegativeValue
        }
        self.value += amount.value
    }
    
    mutating func decrease() {
        self.value -= 1
    }
    
    mutating func decrease(_ amount: Number) throws {
        guard amount.value >= 0 else {
            throw NumberError.isNegativeValue
        }
        self.value -= amount.value
    }
}

extension Number: Equatable {
    static func == (lhs: Number, rhs: Number) -> Bool {
        return lhs.value == rhs.value
    }
}

extension Number: Comparable {
    static func < (lhs: Number, rhs: Number) -> Bool {
        return lhs.value < rhs.value
    }
}

extension Number: ExpressibleByIntegerLiteral {
    typealias IntegerLiteralType = Int
    
    init(integerLiteral value: Int) {
        self.value = value
    }
}

extension Number: CustomStringConvertible {
    var description: String {
        return "\(self.value)"
    }
}
