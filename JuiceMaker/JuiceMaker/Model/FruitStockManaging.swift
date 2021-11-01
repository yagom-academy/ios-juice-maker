//
//  StoreProtocol.swift
//  JuiceMaker
//
//  Created by Jae-hoon Sim on 2021/10/21.
//

import Foundation

protocol FruitStockManaging {
    func checkFruitStock(of fruit: Fruit, by quantity: Int) throws -> Bool
    func changeFruitStock(of fruit: Fruit, by quantity: Int, calculate: (Int, Int) -> Int) throws
    func currentFruitStock(of fruit: Fruit) throws -> Int
}
