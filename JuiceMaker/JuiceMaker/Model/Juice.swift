//
//  Juice.swift
//  JuiceMaker
//
//  Created by soyounglee on 2022/02/16.
//

import Foundation

enum Juice {
  case strawberry
  case banana
  case kiwi
  case pineapple
  case strawberryBanana
  case mango
  case mangoKiwi
}

extension Juice {
  typealias Ingredient = (Fruit, Int)
  var ingredients: [Ingredient] {
    switch self {
    case .strawberry:
      return [(.strawberry, 16)]
    case .banana:
      return [(.banana, 2)]
    case .kiwi:
      return [(.kiwi, 3)]
    case .pineapple:
      return [(.pineapple, 2)]
    case .strawberryBanana:
      return [(.strawberry, 10), (.banana, 1)]
    case .mango:
      return [(.mango, 3)]
    case .mangoKiwi:
      return [(.mango, 2), (.kiwi, 1)]
    }
  }
}
