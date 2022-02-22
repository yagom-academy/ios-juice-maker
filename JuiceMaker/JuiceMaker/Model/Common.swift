//
//  Common.swift
//  JuiceMaker
//
//  Created by 김영훈 on 2022/02/22.
//

import Foundation

enum Fruit {
    case strawberry, banana, pineapple, kiwi, mango
}

enum Juice {
    case strawberryJuice, bananaJuice, pineappleJuice, kiwiJuice, mangoJuice
}

enum JuiceMakingError: Error {
    case notEnoughStock
    case notAllowedFruit
    case noOption
    case duplicatedFruit
}


