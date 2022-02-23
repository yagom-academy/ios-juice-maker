//
//  JuiceMaker - FruitStore.swift
//  Created by Lingo, TaeAngel.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

final class FruitStore {
  private(set) var stock = [Fruit: Int]()
  
  init() {
    self.configureStock()
  }
  
  private func configureStock() {
    let defaultCount = 10
    
    for fruit in Fruit.allCases {
      stock[fruit] = defaultCount
    }
  }
  
  func changeStock(of fruit: Fruit, by amount: Int) throws {
    guard let item = self.stock[fruit] else {
      throw MakeJuiceError.notExistFruit
    }
    guard item + amount >= 0 else {
      throw MakeJuiceError.outOfStock
    }
    self.stock[fruit] = item + amount
  }
  
  func changeNotCheckStock(of fruit: Fruit, by amount: Int) throws {
    guard let item = self.stock[fruit] else {
      throw MakeJuiceError.notExistFruit
    }
    self.stock[fruit] = item + amount
  }
}
