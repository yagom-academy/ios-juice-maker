//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// MARK: - JuiceMaker Type
class JuiceMaker {
  var stock = Stock()
  
  func make(of orderedJuice: Juice) {
    do {
      let requiredFruits: [Fruit: Int] = try checkRequiredFruits(for: orderedJuice)
      if try hasEnoughFruits(of: requiredFruits) {
        comsumeStockedFruits(for: requiredFruits)
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
        throw FruitError.invalidFruit
      }
      requiredFruits[fruit] = quantity
    }
    
    return requiredFruits
  }
  
  private func hasEnoughFruits(of requiredFruits: [Fruit: Int]) throws -> Bool {
 
    for (fruit, requiredQuantity) in requiredFruits {
      let stockedQuantity = try stock.count(for: fruit)
      if stockedQuantity < requiredQuantity {
        print("\(fruit)(이)가 \(requiredQuantity - stockedQuantity)개 부족합니다.")
        return false
      }
    }
    
    return true
  }
  
  private func comsumeStockedFruits(for requiredFruits: [Fruit: Int]) {
    for (fruit, quantity) in requiredFruits {
      stock.subtract(for: fruit, amount: quantity)
    }
  }
  
  private func printOrderCompleted(for orderedJuice: Juice) {
    print("\(orderedJuice.name)가 나왔습니다! 맛있게 드세요!")
  }
  
  private func handleErrorForMake(_ error: Error) {
    switch error {
    case FruitError.invalidFruit,
         JuiceError.invalidJuice,
         RecipeError.invalidRecipe:
      print(error)
    default:
      print("알 수 없는 에러입니다. \(error)")
    }
  }
}
