//
//  Fruit.swift
//  JuiceMaker
//
//  Created by 기원우 on 2021/03/17.
//

import Foundation

class Fruit {
    private let _name: String
    
    init(name: String) {
        _name = name
    }
}

class Strawberry: Fruit {}
class Banana: Fruit {}
class Pineapple: Fruit {}
class Kiwi: Fruit {}
class Mango: Fruit {}
