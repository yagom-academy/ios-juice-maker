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
  
  init(newFruitName: String) {
    name = newFruitName
  }
  
  var description: String {
    return "\(name) 잔여량: \(quantity)"
  }
}

struct Juice {
  private var name: String
  private(set) var ingredients: [Fruit: Int]
  
  init(newMenuName: String, requiredIngredients: [Fruit: Int]) {
    name = newMenuName
    ingredients = requiredIngredients
  }
}
