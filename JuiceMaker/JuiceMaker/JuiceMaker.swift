//
//  JuiceMaker - JuiceMaker.swift
//  Created by 강경, Ryan.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// MARK: - JuiceMaker Type
class JuiceMaker {
  func make(of orderedJuice: Juice) {
    do {
      let requiredFruits: [Fruit: Int] = try checkRequiredFruits(for: orderedJuice)
      if try hasEnoughFruits(of: requiredFruits) {
        try consumeStockedFruits(for: requiredFruits)
        printOrderCompleted(for: orderedJuice)
      }
    } catch {
      handleErrorForMake(error)
    }
  }
  
  // MARK: - Component Methods for 'make(of:)'
  private func checkRequiredFruits(for orderedJuice: Juice) throws -> [Fruit: Int] {
    var requiredFruits = [Fruit: Int]()
    let recipe = JuiceRecipe()
    
    for ingredient in try recipe.find(for: orderedJuice).ingredient {
      guard let fruit = ingredient.fruitName,
            let quantity = ingredient.quantity else {
        throw JuiceError.nilHasOccurredWhileCheckingRequiredFruits
      }
      requiredFruits[fruit] = quantity
    }
    
    return requiredFruits
  }
  
  private func hasEnoughFruits(of requiredFruits: [Fruit: Int]) throws -> Bool {
 
    for (fruit, requiredQuantity) in requiredFruits {
      let stockedQuantity = try Stock.shared.count(for: fruit)
      if stockedQuantity < requiredQuantity {
        print("\(fruit)(이)가 \(requiredQuantity - stockedQuantity)개 부족합니다.")
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
  
  private func printOrderCompleted(for orderedJuice: Juice) {
    print("\(orderedJuice.name)가 나왔습니다! 맛있게 드세요!")
  }
  
  private func handleErrorForMake(_ error: Error) {
    print(error)
  }
}
