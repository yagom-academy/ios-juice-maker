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
  
  func checkStock(of fruits: [Fruit: Int]) -> Bool {
    return fruits.keys
      .filter { self.stock.keys.contains($0) }
      .count == fruits.count
  }
  
  func canMake(_ fruits: [Fruit: Int]) -> Bool {
    return self.stock
      .merging(fruits) { $0 - $1 }
      .filter { $0.value < Int.zero }
      .count == Int.zero
  }
  
  func consumeStock(of fruits: [Fruit: Int]) {
    self.stock.merge(fruits) { $0 - $1 }
  }
}
