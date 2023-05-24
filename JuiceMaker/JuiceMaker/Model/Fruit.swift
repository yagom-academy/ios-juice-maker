//
//  Fruit.swift
//  JuiceMaker
//
//  Created by Minsup, Serena on 2023/05/09.
//

enum Fruit: String {
    case strawberry = "딸기"
    case banana = "바나나"
    case pineapple = "파인애플"
    case kiwi = "키위"
    case mango = "망고"
    
    var name: String {
        return self.rawValue
    }
}
