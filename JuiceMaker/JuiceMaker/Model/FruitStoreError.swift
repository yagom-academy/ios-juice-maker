//
//  FruitStoreError.swift
//  JuiceMaker
//
//  Created by Minsup, Serena on 2023/05/09.
//

enum FruitStoreError: Error {
    case notFoundKey(Fruit), notEnoughStock(Fruit)
}
