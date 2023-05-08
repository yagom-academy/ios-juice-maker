//
//  JuiceMakerEnums.swift
//  JuiceMaker
//
//  Created by 김하연 on 2023/05/08.
//

import Foundation

enum Fruit {
    case strawberry, banana, pineapple, kiwi, mango
}

enum Juice {
    case strawberry, banana, kiwi, pineapple, strawNana, mango, mangKi
}

enum FruitJuiceError: Error {
    case insufficientFruitStock
    case notFoundFruitInformation
}
