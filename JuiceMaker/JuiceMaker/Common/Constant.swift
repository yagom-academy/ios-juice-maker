//
//  Constant.swift
//  JuiceMaker
//
//  Created by 김태현 on 2022/02/22.
//

enum Constant {
    static let defaultFruitAmount = 10
    
    typealias Recipe = [(Fruit, Int)]
    
    static let strawberryJuiceRecipe = [(Fruit.strawberry, 16)]
    static let bananaJuiceRecipe = [(Fruit.banana, 2)]
    static let kiwiJuiceRecipe = [(Fruit.kiwi, 3)]
    static let pineappleJuiceRecipe = [(Fruit.pineapple, 2)]
    static let strawberryBananaJuiceRecipe = [(Fruit.strawberry, 10), (.banana, 1)]
    static let mangoJuiceRecipe = [(Fruit.mango, 3)]
    static let mangoKiwiJuiceRecipe = [(Fruit.mango, 2), (.kiwi, 1)]
}
