//
//  Fruit.swift
//  JuiceMaker
//
//  Created by Vayne, 우롱차 on 2022/02/24.
//

import Foundation

enum Fruit {
    case strawberry, banana, pineapple, kiwi, mango
    
    static let defaultStock = 10
    static let defaultFruitStock = [Fruit.strawberry: Fruit.defaultStock,
                                Fruit.banana: Fruit.defaultStock,
                                Fruit.pineapple: Fruit.defaultStock,
                                Fruit.kiwi: Fruit.defaultStock,
                                Fruit.mango: Fruit.defaultStock]
}
