//
//  JuiceMakerError.swift
//  JuiceMaker
//
//  Created by Harry, kokkilE.
//

enum JuiceMakerError: Error {
    case outOfStock
}

enum FruitStoreError: Error {
    case belowZeroQuantity
    case invalidFruitInput
}
