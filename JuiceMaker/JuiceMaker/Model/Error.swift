//
//  Error.swift
//  JuiceMaker
//
//  Created by hisop, morgan on 2023/09/12.
//

enum OrderFail: Error {
    case wrongInput
    case lackIngredient
    case noMenu
}
