//
//  JuiceMaker - FruitStore.swift
//  Created by Lingo, TaeAngel.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

final class FruitStore {
  private var stock = [Fruit: Int]()
  
  init() {
    self.configureStock()
  }
  
  private func configureStock() {
    let defaultCount = 10
    
    for fruit in Fruit.allCases {
      self.stock[fruit] = defaultCount
    }
  }
  
  func checkStock(
    of fruit: Fruit,
    in amount: Int,
    by operation: (Int, Int) -> Int
  ) -> Result<Int, MakeJuiceError> {
    guard let item = self.stock[fruit] else {
      return .failure(.notExistFruit)
    }
    guard operation(item, amount) >= 0 else {
      return .failure(.outOfStock)
    }
    return .success(item)
  }
  
  func changeStock(of fruit: Fruit, in amount: Int, by operation: (Int, Int) -> Int) {
    guard let item = self.stock[fruit] else {
      return
    }
    self.stock[fruit] = operation(item, amount)
  }
}
