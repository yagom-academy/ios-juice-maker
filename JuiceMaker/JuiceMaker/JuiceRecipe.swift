//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct Recipe {
    typealias Recipe = [(fruit: String, requiredQuantity: Int)]
    
    let strawberryJuiceRecipe: Recipe = [("딸기", 16)]
    let bananaJuiceRecipe: Recipe = [("바나나", 2)]
    let kiwiJuiceRecipe: Recipe = [("키위", 3)]
    let pineappleJuiceRecipe: Recipe = [("파인애플", 2)]
    let strawberryBananaJuiceRecipe: Recipe = [("딸기", 10), ("바나나", 1) ]
    let mangoJuiceRecipe: Recipe = [("망고", 3)]
    let mangoKiwiJuiceRecipe: Recipe = [("망고", 2), ("키위", 1)]
}

