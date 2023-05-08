//
//  Recipe.swift
//  JuiceMaker
//
//  Created by 훈맹구 on 2023/05/08.
//

import Foundation

enum Recipe {
    case strawberryJuice(strawberry: Int = 16)
    case bananaJuice(banana: Int = 2)
    case kiwiJuice(kiwi: Int = 3)
    case pineappleJuice(pineapple: Int = 2)
    case strawberryBananaJuice(strawberry: Int = 10, banana: Int = 1)
    case mangoJuice(mango: Int = 3)
    case mangoKiwiJuice(mango: Int = 2, kiwi: Int = 1)
}
