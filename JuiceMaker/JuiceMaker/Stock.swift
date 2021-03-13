//
//  Stock.swift
//  JuiceMaker
//
//  Created by 강경 on 2021/03/08.
//

import Foundation

// MARK: - Stock Type
class Stock {
  private var stock = [Fruit: Int]()
  
  init() {
    for fruit in Fruit.allCases {
      self.stock[fruit] = 10
    }
  }
  
  func count(for fruit: Fruit) throws -> Int {
    guard let fruitNumberInStock = stock[fruit] else {
      throw FruitError.invalidFruit
    }
    return fruitNumberInStock
  }
  
  func subtract(for fruit: Fruit, amount: Int = 1) throws {
    guard var fruitNumberInStock = stock[fruit] else {
      throw FruitError.invalidFruit
    }
    fruitNumberInStock -= amount
  }
  
  func add(for fruit: Fruit) throws {
    guard var FruitNumberInStock = stock[fruit] else {
      throw FruitError.invalidFruit
    }
    FruitNumberInStock += 1
  }
}
