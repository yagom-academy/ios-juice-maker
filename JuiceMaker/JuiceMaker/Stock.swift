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
  
  func printInvalidFruitError() {
    print("🔥 과일 입력이 잘못되었습니다.")
  }
  
  func checkStock(for fruit: Fruit) {
    guard let fruitNumberInStock = stock[fruit] else {
      printInvalidFruitError()
      return
    }
    print("\(fruit): \(fruitNumberInStock)")
  }
  
  func count(for fruit: Fruit) throws -> Int {
    guard let fruitNumberInStock = stock[fruit] else {
      throw FruitError.invalidFruit
    }
    return fruitNumberInStock
  }
  
  func subtract(for fruit: Fruit, amount: Int = 1) {
    guard let fruitNumberInStock = stock[fruit] else {
      printInvalidFruitError()
      return
    }
    if fruitNumberInStock >= 0 {
      stock[fruit] = fruitNumberInStock - amount
    } else {
      print()
    }
  }
  
  func add(for fruit: Fruit) {
    guard let fruitNumberInStock = stock[fruit] else {
      printInvalidFruitError()
      return
    }
    stock[fruit] = fruitNumberInStock + 1
  }
}
