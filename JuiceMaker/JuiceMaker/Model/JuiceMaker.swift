//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct Juice {
    var name: JuiceName
    var count: Int = 0

    enum JuiceName {
        case strawberryJuice
        case bananaJuice
        case kiwiJuice
        case pineappleJuice
        case strawberryBananaJuice
        case mangoJuice
        case mangoKiwiJuice
    }
}

// 쥬스 메이커 타입
struct JuiceMaker {
    
}
