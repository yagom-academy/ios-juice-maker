//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceRecipe {
    typealias Recipe = [ingredient]
    
    static let strawberryJuiceRecipe: Recipe = [ingredient("딸기", 16)]
    static let bananaJuiceRecipe: Recipe = [ingredient("바나나", 2)]
    static let kiwiJuiceRecipe: Recipe = [ingredient("키위", 3)]
    static let pineappleJuiceRecipe: Recipe = [ingredient("파인애플", 2)]
    static let strawberryBananaJuiceRecipe: Recipe = [ingredient("딸기", 10), ingredient("바나나", 1) ]
    static let mangoJuiceRecipe: Recipe = [ingredient("망고", 3)]
    static let mangoKiwiJuiceRecipe: Recipe = [ingredient("망고", 2), ingredient("키위", 1)]
}

struct ingredient: Equatable {
    
    let fruit: String
    let requiredQuantity: Int
    let a: A
    
    init(_ fruit: String, _ requiredQuantity: Int) {
        self.fruit = fruit
        self.requiredQuantity = requiredQuantity
        self.a = A()
    }
}
class A: Equatable {
    static func == (lhs: A, rhs: A) -> Bool {
        return true
    }
    
    
}
