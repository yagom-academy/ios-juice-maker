//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Fruit: String, CustomStringConvertible {
    case strawberry = "딸기"
    case bananna = "바나나"
    case pineapple = "파인애플"
    case kiwi = "키위"
    case mango = "망고"
    
    var description: String{
        return rawValue
    }
    
}

// 과일 저장소 타입
class FruitStore {
    
}
