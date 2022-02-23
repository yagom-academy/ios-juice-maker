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
    case strawberryTaste, bananaTaste, kiwiTaste, pineappleTaste, strawberryBannaTaste, mangoTaste, mangoKiwiTaste
}

enum JuiceMakingError: Error {
    case notEnoughStock
    case notRegisteredFruit
    case duplicatedFruit
    case noRecipe
}


