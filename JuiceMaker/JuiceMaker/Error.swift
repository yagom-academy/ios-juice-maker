//
//  Error'.swift
//  JuiceMaker
//
//  Created by Ryan-Son on 2021/03/11.
//

import Foundation

enum FruitError: Error {
  case invalidFruit
}

enum JuiceError: Error {
  case invalidJuice
}

enum RecipeError: Error {
  case invalidRecipe
}
