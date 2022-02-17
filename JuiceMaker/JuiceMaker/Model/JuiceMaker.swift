//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

protocol JuiceMakable {
  func make(juice: Juice) throws
}

// 쥬스 메이커 타입
struct JuiceMaker: JuiceMakable {
  private var fruitStore: FruitStorable
  
  init(fruitStore: FruitStorable) {
    self.fruitStore = fruitStore
  }
  
  func make(juice: Juice) throws {
    let ingredients = juice.ingredients
    var updatedStocks: [Int] = []
    try ingredients.forEach { (fruit, quantity) in
      let originQuantity = fruitStore.stock(of: fruit) ?? 0
      let updatedStock = originQuantity - quantity
      
      guard updatedStock >= 0 else {
        throw JuiceMakerError.notEnoughStock
      }
      
      updatedStocks.append(updatedStock)
    }
    
    for (index, (fruit, _)) in ingredients.enumerated() {
      fruitStore.updateStock(of: fruit, quantity: updatedStocks[index])
    }
  }
}
