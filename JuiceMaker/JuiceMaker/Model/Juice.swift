//
//  Juice.swift
//  JuiceMaker
//
//  Created by Vayne, 우롱차 on 2022/02/24.
//

import Foundation

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
