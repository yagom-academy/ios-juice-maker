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
      guard let item = self.fruitStore.stock[fruit], item >= amount else {
        return false
      }
    }
    return true
  }
  
  func make(_ juice: Juice) {
    guard self.canMake(juice) else {
      return
    }
    do {
      for (fruit, amount) in juice.recipe {
        try self.fruitStore.changeNotCheckStock(of: fruit, by: -amount)
      }
    } catch let error as MakeJuiceError {
      print(error.rawValue)
    } catch {
      print(error.localizedDescription)
    }
  }
}
