//
//  JuiceMaker - JuiceMaker.swift
//  Created by Lingo, TaeAngel.
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
  private let fruitStore = FruitStore()

  private func canMake(_ juice: Juice) -> Bool {
    for (fruit, amount) in juice.recipe {
      guard let _ = try? self.fruitStore.checkStock(of: fruit, in: amount).get() else {
        return false
      }
    }
    return true
  }
  
  func make(_ juice: Juice) {
    guard self.canMake(juice) else {
      return
    }
    for (fruit, amount) in juice.recipe {
      self.fruitStore.changeStock(of: fruit, in: amount, by: -)
    }
  }
}
