//
//  Fruit.swift
//  JuiceMaker
//
//  Created by soyounglee on 2022/02/15.
//

import Foundation

enum Fruit: CaseIterable {
  case strawberry
  case banana
  case pineapple
  case kiwi
  case mango
}

extension Fruit {
  var emoji: String {
    switch self {
    case .strawberry:
      return "🍓"
    case .banana:
      return "🍌"
    case .pineapple:
      return "🍍"
    case .kiwi:
      return "🥝"
    case .mango:
      return"🥭"
    }
  }
}
