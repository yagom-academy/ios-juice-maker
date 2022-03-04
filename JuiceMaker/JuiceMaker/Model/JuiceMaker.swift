//
//  JuiceMaker - JuiceMaker.swift
//  Created by Lingo, TaeAngel.
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
  let fruitStore = FruitStore()

  func make(_ juice: Juice) -> Result<Juice, MakeJuiceError> {
    let recipe = juice.recipe
    guard self.fruitStore.checkStock(of: recipe) else {
      return .failure(.notExistFruit)
    }
    guard self.fruitStore.canMake(recipe) else {
      return .failure(.outOfStock)
    }
    self.fruitStore.consumeStock(of: recipe)
    return .success(juice)
  }
}
