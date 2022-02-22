//
//  JuiceMaker - FruitStore.swift
//  Created by Lingo, TaeAngel.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class FruitStore {
  private(set) var fruits = [Fruit: Int]()
  
  init() {
    let defaultCount = 10
    
    for fruit in Fruit.allCases {
      fruits[fruit] = defaultCount
    }
  }
  
  func change(_ fruit: Fruit, quantity: Int) {
    fruits[fruit] = quantity
  }
}
