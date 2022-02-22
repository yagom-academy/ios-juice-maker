//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

struct Juice {
    enum Menu {
        case strawberry
        case banana
        case kiwi
        case pineapple
        case strawberryBanana
        case mango
        case mangoKiwi
    }
    
    static func recipe(menu: Menu) -> JuiceMakerOption.Recipe {
        switch menu {
        case .strawberry:
            return JuiceMakerOption.strawberryJuiceRecipe
        case .banana:
            return JuiceMakerOption.bananaJuiceRecipe
        case .kiwi:
            return JuiceMakerOption.kiwiJuiceRecipe
        case .pineapple:
            return JuiceMakerOption.pineappleJuiceRecipe
        case .strawberryBanana:
            return JuiceMakerOption.strawberryBananaJuiceRecipe
        case .mango:
            return JuiceMakerOption.mangoJuiceRecipe
        case .mangoKiwi:
            return JuiceMakerOption.mangoKiwiJuiceRecipe
        }
    }
}


// 쥬스 메이커 타입
struct JuiceMaker {
    
}
