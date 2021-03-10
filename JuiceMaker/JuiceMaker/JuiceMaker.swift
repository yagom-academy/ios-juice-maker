//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Juice: String {
  case strawberryJuice = "딸기쥬스"
  case bananaJuice = "바나나쥬스"
  case kiwiJuice = "키위쥬스"
  case pineappleJuice = "파인애플쥬스"
  case strawberryBananaJuice = "딸바쥬스"
  case mangoJuice = "망고쥬스"
  case mangoKiwiJuice = "망고키위쥬스"
}

class JuiceMaker {
  private var stockOfFruit = StockOfFruit()
  
  func makeJuice(juice: Juice) {
    let necessaryStock = necessaryFruit(juice)
    guard let preparedFruit = settingFruit(necessaryStock),
          !preparedFruit.isEmpty else {
      return
    }
    
    for (fruit, stock) in preparedFruit {
      stockOfFruit.use(type: Fruit(rawValue: fruit)!, count: stock)
    }
    
    print("\(juice.rawValue)가 나왔습니다! 맛있게 드세요!")
  }
  
  func settingFruit(_ necessaryStock: [String:Int]) -> [String:Int]? {
    var preparedFruit = [String:Int]()
    
    for(fruit, stock) in necessaryStock {
      guard let necessaryFruit = Fruit(rawValue: fruit) else {
        print("과일 선택이 잘못되었습니다.")
        preparedFruit.removeAll()
        break
      }
      
      let currentStock = stockOfFruit.total(type: necessaryFruit)!
      if currentStock < stock {
        print("\(fruit)의 재료가 \(stock - currentStock)개 부족합니다.")
        preparedFruit.removeAll()
        break
      } else {
        preparedFruit[fruit] = stock
      }
    }
    
    return preparedFruit
  }
  
  func necessaryFruit(_ necessaryJuice: Juice) -> [String:Int] {
    var necessaryFruit = [String:Int]()
    
    let juiceRecipe = JuiceRecipe()
    let necessaryJuiceRecipe = juiceRecipe.ordered(juice: necessaryJuice)
    for ingredient in necessaryJuiceRecipe!.ingredient {
      necessaryFruit[ingredient.fruit] = ingredient.stock
    }
    
    return necessaryFruit
  }
}
