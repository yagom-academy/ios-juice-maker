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
    static let defaultJuiceRecipe = [Juice.strawberryTaste:[Fruit.strawberry: 16],
                                     Juice.bananaTaste:[Fruit.banana: 2],
                                     Juice.kiwiTaste:[Fruit.kiwi: 3],
                                     Juice.pineappleTaste:[Fruit.pineapple: 2],
                                     Juice.strawberryBannaTaste:[Fruit.strawberry: 10, Fruit.banana: 1],
                                     Juice.mangoTaste:[Fruit.mango: 3],
                                     Juice.mangoKiwiTaste:[Fruit.mango: 2, Fruit.kiwi: 1]]
}

enum JuiceMakingError: Error {
    case notEnoughStock
    case notRegisteredFruit
    case duplicatedFruit
    case noRecipe
}

enum ErrorMessage {
    static let notEnoughStock = "재고가 부족합니다."
    static let notRegisteredFruit = "존재하지 않는 과일입니다."
    static let noRecipe = "레서피가 존재하지 않습니다."
    static let unkown = "알 수 없는 오류가 발생했습니다."
}



