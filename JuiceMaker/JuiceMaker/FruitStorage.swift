//
//  FruitStorage.swift
//  JuiceMaker
//
//  Created by James & Tak on 2021/03/12.
//

import Foundation

class FruitStorage {
    static let shared = FruitStorage()
    private(set) var refrigerator: [Fruit: Int]
    
    private init() {
        refrigerator = [:]
        initialize()
    }
    func initialize() {
        refrigerator = [Fruit.strawberry: 10, Fruit.banana: 10, Fruit.kiwi: 10, Fruit.mango: 10, Fruit.pineapple: 10]
    }
}
