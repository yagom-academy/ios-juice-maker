//
//  Storable.swift
//  JuiceMaker
//
//  Created by Oh Donggeon on 2022/02/15.
//

import Foundation

protocol FruitStorable {
    func use(_ fruit: Fruit, to count: Int) throws
    func change(_ fruit: Fruit, to count: Int)
    func checkStock(_ fruit: Fruit, as count: Int) throws -> Bool
    func checkCount(stock fruit: Fruit) -> Int
}
