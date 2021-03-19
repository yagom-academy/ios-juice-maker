//
//  Stock.swift
//  JuiceMaker
//
//  Created by 강경, Ryan on 2021/03/08.
//

import Foundation

// MARK: - Stock Type
class Stock {
  private(set) static var shared = Stock()
  private var stock = [Fruit: Int]()
  
  private init() {
    for fruit in Fruit.allCases {
      self.stock[fruit] = 20
    }
  }
  
  func checkStock(for fruit: Fruit) throws {
    guard let fruitNumberInStock = stock[fruit] else {
      throw FruitError.nilHasOccurredWhileCheckingStock
    }
    print("\(fruit): \(fruitNumberInStock)")
  }
  
  func count(for fruit: Fruit) throws -> Int {
    guard let fruitNumberInStock = stock[fruit] else {
      return returnValueForInvalidInput
    }
    return fruitNumberInStock
  }
  
  func subtract(for fruit: Fruit, amount: Int = 1) throws {
    guard let fruitNumberInStock = stock[fruit] else {
      throw FruitError.nilHasOccurredWhileSubtracting
    }
    if fruitNumberInStock >= 0 {
      stock[fruit] = fruitNumberInStock - amount
    } else {
      print("재고가 없어 더 차감할 수 없습니다.")
    }
  }
  
  func add(for fruit: Fruit) throws {
    guard let fruitNumberInStock = stock[fruit] else {
      throw FruitError.nilHasOccurredWhileSubtracting
    }
    stock[fruit] = fruitNumberInStock + 1
  }
}
