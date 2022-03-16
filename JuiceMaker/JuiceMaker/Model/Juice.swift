//
//  Juice.swift
//  JuiceMaker
//
//  Created by Vayne, 우롱차 on 2022/02/24.
//

import Foundation

enum Juice: Int {
    case strawberryBannaTaste = 1,
         mangoKiwiTaste,
         strawberryTaste,
         bananaTaste,
         pineappleTaste,
         kiwiTaste,
         mangoTaste

    static let defaultJuiceRecipe = [Juice.strawberryTaste:[Fruit.strawberry: 16],
                                     Juice.bananaTaste:[Fruit.banana: 2],
                                     Juice.kiwiTaste:[Fruit.kiwi: 3],
                                     Juice.pineappleTaste:[Fruit.pineapple: 2],
                                     Juice.strawberryBannaTaste:[Fruit.strawberry: 10, Fruit.banana: 1],
                                     Juice.mangoTaste:[Fruit.mango: 3],
                                     Juice.mangoKiwiTaste:[Fruit.mango: 2, Fruit.kiwi: 1]]
    static func getJuiceName(juice: Juice) -> String {
        switch juice.rawValue {
        case 1:
            return "딸바쥬스"
        case 2:
            return "망키쥬스"
        case 3:
            return "딸기쥬스"
        case 4:
            return "바나나쥬스"
        case 5:
            return "파인애플쥬스"
        case 6:
            return "키위쥬스"
        case 7:
            return "망고쥬스"
        default:
            return "미등록 쥬스"
        }
    }
}
