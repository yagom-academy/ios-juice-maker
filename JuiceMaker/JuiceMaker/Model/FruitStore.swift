//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

protocol FruitStorable {
  func updateStock(of fruit: Fruit, stock: Stock)
  func stock(of fruit: Fruit) -> Stock?
}

// 과일 저장소 타입
class FruitStore: FruitStorable {
  var store: [Fruit: Stock] = [:]
  
  init() {
    Fruit.allCases.forEach {
      store[$0] = Stock(10)
    }
  }
  
  func updateStock(of fruit: Fruit, stock: Stock) {
    guard store[fruit] != nil else { return }
    
    store[fruit] = stock
  }
  
  func stock(of fruit: Fruit) -> Stock? {
    return store[fruit]
  }
}
