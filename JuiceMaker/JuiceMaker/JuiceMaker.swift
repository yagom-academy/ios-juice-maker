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
  
  mutating func make(of juice: Juice) {
    let requiredIngredients = checkIngredients(juice)
    let preparedIngredients = setIngredients(requiredIngredients)
    guard !preparedIngredients.isEmpty else { return }
    
    for (fruit, remainingFruit) in preparedIngredients {
      stock.subtract(from: fruit, count: remainingFruit)
    }
    
    print("\(juice.name)가 나왔습니다! 맛있게 드세요!")
  }
  
  func checkIngredients(_ necessaryJuice: Juice) -> [Fruit: Int] {
    var necessaryFruit = [Fruit: Int]()
    
    let juiceRecipe = JuiceRecipe()
    guard let necessaryJuiceRecipe = juiceRecipe.ordered(juice: necessaryJuice) else {
      fatalError()
    }
    for ingredient in necessaryJuiceRecipe.ingredient {
      necessaryFruit[ingredient.fruit] = ingredient.stock
    }
    
    return necessaryFruit
  }
  
  func setIngredients(_ necessaryStock: [Fruit: Int]) -> [Fruit: Int] {
    var preparedFruit = [Fruit: Int]()
    
    for (fruit, remainingFruit) in necessaryStock {
      let necessaryFruit: Fruit = fruit
      
      let currentStock = stock.count(for: necessaryFruit)
      if currentStock < remainingFruit {
        print("\(fruit)의 재료가 \(remainingFruit - currentStock)개 부족합니다.")
        preparedFruit.removeAll()
        break
      } else {
        preparedFruit[fruit] = remainingFruit
      }
    }
    
    return preparedFruit
  }
}
