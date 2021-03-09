//
//  Stock.swift
//  JuiceMaker
//
//  Created by Ryan-Son on 2021/03/09.
//

import Foundation

struct Fruit: CustomStringConvertible, Hashable {
  private var name: String
  private(set) var quantity: Int = 10
  var description: String {
    return "\(name) 잔여량: \(quantity)"
  }
  
  init(nameOf newFruitName: String, quantityInStock: Int = 10) {
    name = newFruitName
    quantity = quantityInStock
  }
  
  mutating func add() {
    quantity += 1
  }
  mutating func subtract() {
    quantity -= 1
  }
}

struct Stock {
  static let strawberry = Fruit(nameOf: "딸기")
  static let banana = Fruit(nameOf: "바나나")
  static let kiwi = Fruit(nameOf: "키위")
  static let pineapple = Fruit(nameOf: "파인애플")
  static let mango = Fruit(nameOf: "망고")
}

