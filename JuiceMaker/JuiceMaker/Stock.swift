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
  
  init(nameOf newFruitName: String, quantityInStock: Int = 10) {
    name = newFruitName
    quantity = quantityInStock
  }
  
  var description: String {
    return "\(name) 잔여량: \(quantity)"
  }
}

struct Stock {
  let strawberry = Fruit(nameOf: "딸기")
  let banana = Fruit(nameOf: "바나나")
  let kiwi = Fruit(nameOf: "키위")
  let pineapple = Fruit(nameOf: "파인애플")
  let mango = Fruit(nameOf: "망고")
}

