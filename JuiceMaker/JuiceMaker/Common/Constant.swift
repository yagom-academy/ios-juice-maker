//
//  Constant.swift
//  JuiceMaker
//
//  Created by 김태현 on 2022/02/22.
//

enum Constant {
    static let defaultFruitAmount = 10
    
    enum CustomType {
        typealias Recipe = [(Fruit, Int)]
    }
    
    enum Recipes {
        static let strawberryJuice = [(Fruit.strawberry, 16)]
        static let bananaJuice = [(Fruit.banana, 2)]
        static let kiwiJuice = [(Fruit.kiwi, 3)]
        static let pineappleJuice = [(Fruit.pineapple, 2)]
        static let strawberryBananaJuice = [(Fruit.strawberry, 10), (.banana, 1)]
        static let mangoJuice = [(Fruit.mango, 3)]
        static let mangoKiwiJuice = [(Fruit.mango, 2), (.kiwi, 1)]
    }
}
