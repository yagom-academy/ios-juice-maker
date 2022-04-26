//
//  Fruit.swift
//  JuiceMaker
//
//  Created by 전민수 on 2022/04/25.
//

import Foundation

enum Fruit: String {
    case strawberry = "strawberry"
    case banana = "banana"
    case pineapple = "pineapple"
    case kiwi = "kiwi"
    case mango = "mango"
}

enum stockError: Error {
    case invalidSelection
}
