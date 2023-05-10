//
//  FruitStoreError.swift
//  JuiceMaker
//
//  Created by 훈맹구 on 2023/05/09.
//

enum FruitStoreError: Error {
    case shortageOfStock(fruit: Fruit)
}
