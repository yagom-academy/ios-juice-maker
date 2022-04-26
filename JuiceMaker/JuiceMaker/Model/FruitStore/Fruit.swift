//
//  Fruit.swift
//  JuiceMaker
//
//  Created by Derrik 웡빙 on 2022/04/25.
//

import Foundation

enum Fruit: CaseIterable {
    case strawberry
    case banana
    case kiwi
    case pineapple
    case mango
}

enum StockError: Error {
    case notEnoughIngredient
}

