//
//  JuiceMenuManager.swift
//  JuiceMaker
//
//  Created by Ryan-Son on 2021/03/09.
//

import Foundation

struct Juice {
  private var name: String
  private(set) var ingredients: [Fruit: Int]
  
  init(newMenuName: String, requiredIngredients: [Fruit: Int]) {
    name = newMenuName
    ingredients = requiredIngredients
  }
}
