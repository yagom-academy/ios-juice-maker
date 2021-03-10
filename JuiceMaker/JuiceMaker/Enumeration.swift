//
//  Enumeration.swift
//  JuiceMaker
//
//  Created by 강경 on 2021/03/11.
//

import Foundation

enum Fruit: String, CaseIterable, Codable {
  case strawberry, banana, pineapple, kiwi, mango
}

enum Juice: String, Codable {
  case strawberryJuice, bananaJuice, kiwiJuice, pineappleJuice,
       strawberryBananaJuice, mangoJuice, mangoKiwiJuice
  
  var name: String {
    switch self {
    case .strawberryJuice:
      return "딸기쥬스"
    case .bananaJuice:
      return "바나나쥬스"
    case .kiwiJuice:
      return "키위쥬스"
    case .pineappleJuice:
      return "파인애플쥬스"
    case .strawberryBananaJuice:
      return "딸바쥬스"
    case .mangoJuice:
      return "망고쥬스"
    case .mangoKiwiJuice:
      return "망고키위쥬스"
    }
  }
}
