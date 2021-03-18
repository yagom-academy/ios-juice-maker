//
//  JuiceMaker - JuiceMaker.swift
//  Created by 강경, Ryan.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// MARK: - JuiceMaker Type
class JuiceMaker {
  var orderResult = OrderResult(message: "", isSuccessed: false)
  
  func make(of orderedJuice: Juice) throws {
    let requiredFruits: [Fruit: Int] = try checkRequiredFruits(for: orderedJuice)
    if hasEnoughFruits(of: requiredFruits) {
      try consumeStockedFruits(for: requiredFruits)
      updateOrderResult(for: orderedJuice)
    }
  }
  
  // MARK: - Component Methods for 'make(of:)'
  private func checkRequiredFruits(for orderedJuice: Juice) throws -> [Fruit: Int] {
    var requiredFruits = [Fruit: Int]()
    let recipe = try JuiceRecipe()
    
    for ingredient in try recipe.find(for: orderedJuice).ingredient {
      guard let fruit = ingredient.fruitName,
            let quantity = ingredient.quantity else {
        throw JuiceError.nilHasOccurredWhileCheckingRequiredFruits
      }
      requiredFruits[fruit] = quantity
    }
    
    return requiredFruits
  }
  
  private func hasEnoughFruits(of requiredFruits: [Fruit: Int]) -> Bool {

    for (fruit, requiredQuantity) in requiredFruits {
      let stockedQuantity = try Stock.shared.count(for: fruit)
      if stockedQuantity < requiredQuantity {
        orderResult.isSuccessed = false
        orderResult.message =
          "\(fruit)(이)가 \(requiredQuantity - stockedQuantity)개 부족합니다.\n재고를 수정할까요?"
        
        return false
      }
    }
    
    return true
  }
  
  private func consumeStockedFruits(for requiredFruits: [Fruit: Int]) throws {
    for (fruit, quantity) in requiredFruits {
      try Stock.shared.subtract(for: fruit, amount: quantity)
    }
  }
  
  private func updateOrderResult(for orderedJuice: Juice) {
    orderResult.isSuccessed = true
    orderResult.message = "\(orderedJuice.name)가 나왔습니다! 맛있게 드세요!"
  }
}
