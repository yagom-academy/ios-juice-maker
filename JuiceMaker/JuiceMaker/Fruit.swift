//
//  Fruit.swift
//  JuiceMaker
//
//  Created by 김민성 on 2021/03/14.
//

import Foundation

class Fruit {
    private let name: String
    private let origin: String
    private let price: Int

    init(name: String, origin: String, price: Int) {
        self.name = name
        self.origin = origin
        self.price = price
    }
}

class Strawberry: Fruit {}

class Banana: Fruit {}

class Kiwi: Fruit {}

class Pineapple: Fruit {}

class Mango: Fruit {}

