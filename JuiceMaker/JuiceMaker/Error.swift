//
//  Error.swift
//  JuiceMaker
//
//  Created by 강경 on 2021/03/11.
//

import Foundation

enum JsonError: Error {
    case invalidJsonString
}

enum FruitError: Error {
    case invalidFruitRawValue
    case invalidFruit
}

enum JuiceError: Error {
    case invalidJuice
}
