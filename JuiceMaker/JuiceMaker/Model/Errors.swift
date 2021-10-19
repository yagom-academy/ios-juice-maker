//
//  Errors.swift
//  JuiceMaker
//
//  Created by Jun Bang on 2021/10/19.
//

import Foundation

enum FruitStoreError: Error {
    case insufficientFruits(unavailabeFruits: [Fruit : Int])
}
