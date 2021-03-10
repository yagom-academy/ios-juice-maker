//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct JuiceMaker {
  private var stock = Stock()
  
  mutating func make(of orderedJuice: Juice) {
    let requiredFruits = getRequiredFruits(of: orderedJuice)
    let stockedFruits = getStockedFruits(by: requiredFruits)
    if stockedFruits.isEmpty {
      print("입력이 잘못되었습니다. 찾는 과일이 없습니다. 에러 발생 메서드 make(of:)")
    }

    for (fruit, quantity) in stockedFruits {
      stock.subtract(for: fruit, amount: quantity)
    }
    
    print("\(orderedJuice.name)가 나왔습니다! 맛있게 드세요!")
  }
  
  func getRequiredFruits(of orderedJuice: Juice) -> [Fruit: Int] {
    var requiredFruits = [Fruit: Int]()
    
    let recipe = JuiceRecipe()
    guard let recipeForOrderedJuice = recipe.find(for: orderedJuice) else {
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
}
