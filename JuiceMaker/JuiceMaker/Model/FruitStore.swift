//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

protocol FruitStorable {
  func updateStock(of fruit: Fruit, quantity: Int)
  func stock(of fruit: Fruit) -> Int?
}

// 과일 저장소 타입
class FruitStore: FruitStorable {
  private var store: [Fruit: Int] = [.strawberry: 10,
                               .banana: 10,
                               .pineapple: 10,
                               .mango: 10,
                               .kiwi: 10]
  
  init(qauntity: Int) {
    Fruit.allCases.forEach {
      store[$0] = qauntity
    }
  }
  
  func updateStock(of fruit: Fruit, quantity: Int) {
    guard store[fruit] != nil,
          quantity >= 0 else { return }
    
    store[fruit] = quantity
  }
  
  func stock(of fruit: Fruit) -> Int? {
    return store[fruit]
  }
}
