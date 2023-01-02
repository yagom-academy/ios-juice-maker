//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    
    enum Menu {
        case strawberryJuice
        case bananaJuice
        case pineappleJuice
        case kiwiJuice
        case mangoJuice
        case strawberryBananaJuice
        case mangoKiwiJuice
    }
    
    enum Recipe {
        static let usingStrawberry = 16
        static let usingBanana = 2
        static let usingKiwi = 3
        static let usingPineapple = 2
        static let usingMango = 3
        static let usingMixStrawberry = 10
        static let usingMixBanana = 1
        static let usingMixMango = 2
        static let usingMixKiwi = 1
    }
    
    
}
