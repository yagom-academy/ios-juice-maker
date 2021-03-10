//
//  StockOfFruit.swift
//  JuiceMaker
//
//  Created by 강경 on 2021/03/08.
//

import Foundation

enum Fruit: String, CaseIterable, Codable {
  case strawberry, banana, pineapple, kiwi, mango
}

struct Stock {
  private var stock = [Fruit: Int]()
  
  init() {
    for fruit in Fruit.allCases {
      self.stock[fruit] = 1
    }
  }
  
  func count(for fruit: Fruit) -> Int {
    guard let remainingFruitNumber = stock[fruit] else { fatalError() }
    return remainingFruitNumber
  }
  
  mutating func subtract(for fruit: Fruit, amount: Int = 1) {
    guard var stockedFruit = stock[fruit] else { fatalError() }
    stockedFruit -= amount
  }
  
  mutating func add(of fruit: Fruit) {
    guard var stockedFruit = stock[fruit] else { fatalError() }
    stockedFruit += 1
  }
}
