//
//  JuiceMaking.swift
//  JuiceMaker
//
//  Created by Jae-hoon Sim on 2021/10/26.
//

import Foundation

protocol JuiceMaking {
    func makeJuice(menu: JuiceMenu) throws
    func currentFruitStock(of fruit: Fruit) throws -> Int
    func changeFruitStock(of fruit: Fruit, by quantity: Int, isIncrement: Bool) throws
}
