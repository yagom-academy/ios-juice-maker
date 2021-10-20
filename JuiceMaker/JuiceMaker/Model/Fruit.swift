//
//  Fruit.swift
//  JuiceMaker
//
//  Created by Jun Bang on 2021/10/20.
//

import Foundation

enum Fruit: String, CustomStringConvertible, CaseIterable {
    case strawberry = "딸기"
    case bananna = "바나나"
    case pineapple = "파인애플"
    case kiwi = "키위"
    case mango = "망고"
    
    var description: String {
        return rawValue
    }
}
