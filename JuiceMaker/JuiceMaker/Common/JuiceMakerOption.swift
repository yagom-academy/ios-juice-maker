//
//  JuiceMakerOption.swift
//  JuiceMaker
//
//  Created by 김태현 on 2022/02/22.
//

import Foundation

enum JuiceMakerOption {
    static let defaultFruitAmount = 10
    
    typealias Recipe = [(Fruit, Int)]
    
    static let strawberryJuiceRecipe: Recipe = [(.strawberry, 16)]
    static let bananaJuiceRecipe: Recipe = [(.banana, 2)]
    static let kiwiJuiceRecipe: Recipe = [(.kiwi, 3)]
    static let pineappleJuiceRecipe: Recipe = [(.pineapple, 2)]
    static let strawberryBananaJuiceRecipe: Recipe = [(.strawberry, 10), (.banana, 1)]
    static let mangoJuiceRecipe: Recipe = [(.mango, 3)]
    static let mangoKiwiJuiceRecipe: Recipe = [(.mango, 2), (.kiwi, 1)]
}
