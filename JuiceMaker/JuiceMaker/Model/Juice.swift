//
//  Juice.swift
//  JuiceMaker
//
//  Created by Lingo, TaeAngel. on 2022/02/22.
//

import Foundation

enum Juice: String {
  case strawberry = "딸기"
  case banana = "바나나"
  case pineapple = "파인애플"
  case kiwi = "키위"
  case mango = "망고"
  case strawberryBanana = "딸바"
  case mangoKiwi = "망키"
  
  var description: String {
    return "\(self.rawValue) 쥬스 나왔습니다! 맛있게 드세요!"
  }
  
  var recipe: [Fruit: Int] {
    switch self {
    case .strawberry:
      return [.strawberry: 16]
    case .banana:
      return [.banana: 2]
    case .pineapple:
      return [.pineapple: 2]
    case .kiwi:
      return [.kiwi: 3]
    case .mango:
      return [.mango: 3]
    case .strawberryBanana:
      return [.strawberry: 10, .banana: 1]
    case .mangoKiwi:
      return [.mango: 2, .kiwi: 1]
    }
  }
}
