//
//  FruitStoreError.swift
//  JuiceMaker
//
//  Created by Minsup, Serena on 2023/05/09.
//

public enum FruitStoreError: Error {
    case notFoundFruit(Fruit)
    case notEnoughStock(Fruit)
}

