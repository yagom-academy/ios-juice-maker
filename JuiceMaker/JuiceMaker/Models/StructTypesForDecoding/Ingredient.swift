//
//  Ingredient.swift
//  JuiceMaker
//
//  Created by Ryan-Son on 2021/03/16.
//

import Foundation

struct Ingredient: Decodable {
  var fruitName: Fruit?
  var quantity: Int?
  
  private enum CodingKeys: String, CodingKey {
    case fruitName
    case quantity
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.fruitName = try? container.decode(Fruit.self, forKey: .fruitName)
    self.quantity = try? container.decode(Int.self, forKey: .quantity)
  }
}
