//
//  Fruit.swift
//  JuiceMaker
//
//  Created by yun on 2021/06/08.
//

import Foundation

enum Fruit: CaseIterable {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
    
    static func makeFruitList() -> [Fruit] {
        return Fruit.allCases
    }
}
