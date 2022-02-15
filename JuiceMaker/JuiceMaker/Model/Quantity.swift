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
        guard value < 0 else {
            quantity = 0
            return
        }
        quantity = value
    }
    
}

extension Quantity {
    
    static let ZERO: Quantity = Quantity(0)
    
}
