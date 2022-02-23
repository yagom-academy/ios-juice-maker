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
  
  func changeStock(of fruit: Fruit, by amount: Int) {
    guard let item = self.stock[fruit] else {
      return
    }
    guard item + amount >= 0 else {
      return
    }
    self.stock[fruit] = item + amount
  }
  
  /* 질문사항
  func changeStock2(of fruit: Fruit, by amount: Int) {
    guard let item = self.stock[fruit] else {
      return
    }
    self.stock[fruit] = item + amount
  }
  */
}
