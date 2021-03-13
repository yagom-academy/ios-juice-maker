//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// MARK: - JuiceMaker Type
class JuiceMaker {
  private var stock = Stock()
  
  func make(of orderedJuice: Juice) {
    do {
      let requiredFruitsForJuice = try requiredFruits(for: orderedJuice)
      let stockedFruitsForJuice = try stockedFruits(for: requiredFruitsForJuice)
      
      if hasEnoughIngredients(in: stockedFruitsForJuice) {
        try subtractStockedFruits(from: stockedFruitsForJuice)
        printOrderCompleted(for: orderedJuice)
      }
    } catch {
      switch error {
      case FruitError.invalidFruit:
        print("과일 입력이 잘못되었습니다.")
      case JuiceError.invalidJuice:
        print("쥬스 입력이 잘못되었습니다.")
      case RecipeError.invalidRecipe:
        print("레시피 입력이 잘못되었습니다.")
      default:
        print("알 수 없는 에러입니다. \(error)")
      }
    }
  }
  
  // MARK: - Component Methods for 'make(of:)'
  private func requiredFruits(for orderedJuice: Juice) throws -> [Fruit: Int] {
    var requiredFruits = [Fruit: Int]()

    for ingredient in try recipe(for: orderedJuice).ingredient {

      guard let fruitName = ingredient.fruitName else {
        throw FruitError.invalidFruit
      }
      requiredFruits[fruitName] = ingredient.quantity
    }
    
    return requiredFruits
  }
  
  private func stockedFruits(for requiredFruits: [Fruit: Int]) throws -> [Fruit: Int] {
    var stockedFruits = [Fruit: Int]()
    
    for (fruit, requiredQuantity) in requiredFruits {
      let stockedQuantity = try stock.count(for: fruit)
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
  
  private func subtractStockedFruits(from stockedFruits: [Fruit: Int]) throws {
    for (fruit, quantity) in stockedFruits {
      try stock.subtract(for: fruit, amount: quantity)
    }
  }
  
  private func printOrderCompleted(for orderedJuice: Juice) {
    print("\(orderedJuice.name)가 나왔습니다! 맛있게 드세요!")
  }
  
  private func recipe(for orderedJuice: Juice) throws -> JuiceType {
    let recipe = JuiceRecipe()
    guard let recipeForOrderedJuice = try recipe.find(for: orderedJuice) else {
      throw RecipeError.invalidRecipe
    }
    
    return recipeForOrderedJuice
  }
}
