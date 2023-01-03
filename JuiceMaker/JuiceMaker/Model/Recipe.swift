//
//  Recipe.swift
//  JuiceMaker
//
//  Created by Christy Lee on 2023/01/03.
//

import Foundation


enum Recipe: Int {
    case strawberryJuice, bananaJuice, kiwiJuice, pineappleJuice, strawberryBananaJuice, mangoJuice, mangoKiwiJuice
    struct Values {
        let first: [String: Int], second: [String: Int]?
    }
    var values: Values {
        switch self {
        case .strawberryJuice:
            return Values(first: ["strawberry": 16], second: nil)
        case .bananaJuice:
            return Values(first: ["banana": 2], second: nil)
        case .kiwiJuice:
            return Values(first: ["kiwi": 3], second: nil)
        case .pineappleJuice:
            return Values(first: ["pineapple": 2], second: nil)
        case .strawberryBananaJuice:
            return Values(first: ["strawberry": 10], second: ["banana": 1])
        case .mangoJuice:
            return Values(first: ["mango": 3], second: nil)
        case .mangoKiwiJuice:
            return Values(first: ["mango": 2], second: ["kiwi": 1])
        }
    }
}
