//
//  JuiceRequirement.swift
//  JuiceMaker
//
//  Created by 천수현 on 2021/03/08.
//

import Foundation

struct Requirements : RawRepresentable {
    let rawValue: [requirement]
    static let strawberryRequirement = [(Fruits.strawberry, 16)]
    static let bananaRequirement = [(Fruits.banana, 2)]
    static let kiwiRequirement = [(Fruits.kiwi, 3)]
    static let pineappleRequirement = [(Fruits.pineapple, 2)]
    static let strawBananaRequirement = [(Fruits.strawberry, 10), (Fruits.banana, 1)]
    static let mangoRequirement = [(Fruits.mango, 3)]
    static let mangoKiwiRequirement = [(Fruits.mango, 2), (Fruits.kiwi, 1)]
}
