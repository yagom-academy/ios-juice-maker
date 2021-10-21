//
//  StoreProtocol.swift
//  JuiceMaker
//
//  Created by Jae-hoon Sim on 2021/10/21.
//

import Foundation

protocol FruitStorage {
    func changeFruitStock(of fruit: Fruit, by quantity: Int, calculate: (Int, Int) -> Int) throws
    func currentFruitStock(of fruit: Fruit) throws -> Int
}
