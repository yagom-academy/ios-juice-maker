//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Juice: String, Codable {
  case strawberryJuice, bananaJuice, kiwiJuice, pineappleJuice,
       strawberryBananaJuice, mangoJuice, mangoKiwiJuice
  
  var name: String {
    switch self {
    case .strawberryJuice:
      return "딸기쥬스"
    case .bananaJuice:
      return "바나나쥬스"
    case .kiwiJuice:
      return "키위쥬스"
    case .pineappleJuice:
      return "파인애플쥬스"
    case .strawberryBananaJuice:
      return "딸바쥬스"
    case .mangoJuice:
      return "망고쥬스"
    case .mangoKiwiJuice:
      return "망고키위쥬스"
    }
  }
}

struct JuiceMaker {
  private var stock = Stock()
  
  mutating func make(of orderedJuice: Juice) {
    let requiredFruits = getRequiredFruits(of: orderedJuice)
    let stockedFruits = getStockedFruits(by: requiredFruits)
    guard !stockedFruits.isEmpty else { return }
    
    for (fruit, quantity) in stockedFruits {
      stock.subtract(for: fruit, amount: quantity)
    }
    
    print("\(orderedJuice.name)가 나왔습니다! 맛있게 드세요!")
  }
  
  func getRequiredFruits(of orderedJuice: Juice) -> [Fruit: Int] {
    var requiredFruits = [Fruit: Int]()
    
    let recipe = JuiceRecipe()
    guard let recipeForOrderedJuice = recipe.find(for : orderedJuice) else {
      fatalError()
    }
    
    for ingredient in recipeForOrderedJuice.ingredient {
      requiredFruits[ingredient.fruitName] = ingredient.quantity
    }
    
    return requiredFruits
  }
  
  func getStockedFruits(by requiredFruits: [Fruit: Int]) -> [Fruit: Int] {
    var stockedFruits = [Fruit: Int]()
    
    for (fruit, requiredQuantity) in requiredFruits {
      let requiredFruit: Fruit = fruit
      
      let stockedQuantity = stock.count(for: requiredFruit)
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
}
