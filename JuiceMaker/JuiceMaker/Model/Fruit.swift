//
//  Fruit.swift
//  JuiceMaker
//
//  Created by yun on 2021/06/08.
//

import Foundation

enum Fruit: Int, CaseIterable {
    case strawberry = 1
    case banana = 2
    case pineapple = 3
    case kiwi = 4
    case mango = 5
    
    static func makeFruitList() -> [Fruit] {
        return Fruit.allCases
    }
    
    var fruitTag: Int {
        return self.rawValue
    }
}
