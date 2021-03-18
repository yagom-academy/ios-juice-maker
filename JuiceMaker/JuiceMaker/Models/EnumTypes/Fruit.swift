//
//  Fruit.swift
//  JuiceMaker
//
//  Created by Ryan-Son on 2021/03/16.
//

import Foundation

enum Fruit: String, CaseIterable, Decodable {
  case strawberry = "Strawberry"
  case banana = "Banana"
  case pineapple = "Pineapple"
  case kiwi = "Kiwi"
  case mango = "Mango"
}

extension Fruit: CustomStringConvertible {
  var description: String {
    switch self {
    case .strawberry:
      return "딸기"
    case .banana:
      return "바나나"
    case .pineapple:
      return "파인애플"
    case .kiwi:
      return "키위"
    case .mango:
      return "망고"
    }
  }
}
