//
//  JuiceRequirement.swift
//  JuiceMaker
//
//  Created by 천수현 on 2021/03/08.
//

struct Requirements : RawRepresentable {
    let rawValue: [fruitAndNeedAmount]
    static let strawberryRequirement = [(FruitType.strawberry, 16)]
    static let bananaRequirement = [(FruitType.banana, 2)]
    static let kiwiRequirement = [(FruitType.kiwi, 3)]
    static let pineappleRequirement = [(FruitType.pineapple, 2)]
    static let strawBananaRequirement = [(FruitType.strawberry, 10), (FruitType.banana, 1)]
    static let mangoRequirement = [(FruitType.mango, 3)]
    static let mangoKiwiRequirement = [(FruitType.mango, 2), (FruitType.kiwi, 1)]
}
