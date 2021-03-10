//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// MARK: - Juice Type
enum Juice: String, Codable {
  case strawberryJuice = "딸기쥬스"
  case bananaJuice = "바나나쥬스"
  case kiwiJuice = "키위쥬스"
  case pineappleJuice = "파인애플쥬스"
  case strawberryBananaJuice = "딸바쥬스"
  case mangoJuice = "망고쥬스"
  case mangoKiwiJuice = "망고키위쥬스"
  
  internal var name: String {
    return rawValue
  }
}

// MARK: - JuiceMaker Type
struct JuiceMaker {
  private var stock = Stock()
  
  mutating func make(of orderedJuice: Juice) {
    let stockedFruitsForJuice = stockedFruits(
      for: requiredFruits(for: orderedJuice)
    )
    
    if hasEnoughIngredients(in: stockedFruitsForJuice) {
      subtractStockedFruits(from: stockedFruitsForJuice)
      printOrderCompleted(for: orderedJuice)
    } else {
      printNotEnoughIngredients()
    }
  }
  
  // MARK: - Component Methods for 'make(of:)'
  private func requiredFruits(for orderedJuice: Juice) -> [Fruit: Int] {
    var requiredFruits = [Fruit: Int]()

    for ingredient in recipe(for: orderedJuice).ingredient {
      requiredFruits[ingredient.fruitName] = ingredient.quantity
    }
    
    return requiredFruits
  }
  
  private func stockedFruits(for requiredFruits: [Fruit: Int]) -> [Fruit: Int] {
    var stockedFruits = [Fruit: Int]()
    
    for (fruit, requiredQuantity) in requiredFruits {
      let stockedQuantity = stock.count(for: fruit)
      if stockedQuantity < requiredQuantity {
        print("\(fruit)의 재료가 \(requiredQuantity - stockedQuantity)개 부족합니다.")
        stockedFruits.removeAll()
        break
      } else {
        stockedFruits[fruit] = requiredQuantity
      }
    }
    
    return stockedFruits
  }
  
  private func hasEnoughIngredients(in stockedFruits: [Fruit: Int]) -> Bool {
    if stockedFruits.isEmpty {
      return false
    } else {
      return true
    }
  }
  
  private mutating func subtractStockedFruits(from stockedFruits: [Fruit: Int]) {
    for (fruit, quantity) in stockedFruits {
      stock.subtract(for: fruit, amount: quantity)
    }
  }
  
  private func printOrderCompleted(for orderedJuice: Juice) {
    print("\(orderedJuice.name)가 나왔습니다! 맛있게 드세요!")
  }
  
  private func recipe(for orderedJuice: Juice) -> Recipe.JuiceRecipe {
    let recipe = JuiceRecipe()
    guard let recipeForOrderedJuice = recipe.find(for: orderedJuice) else {
      printRecipeNotAvailable()
      fatalError()
    }
    
    return recipeForOrderedJuice
  }
  
  private func printRecipeNotAvailable() {
    print("쥬스 레시피가 레시피북에 없습니다.")
  }
  
  private func printNotEnoughIngredients() {
    print("재료가 모자랍니다.")
  }
}
