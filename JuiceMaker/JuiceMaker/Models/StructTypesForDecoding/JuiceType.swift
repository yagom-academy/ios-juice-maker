//
//  JuiceType.swift
//  JuiceMaker
//
//  Created by Ryan-Son on 2021/03/16.
//

import Foundation

struct JuiceType: Decodable {
  var name: String
  var ingredient: [Ingredient]
}
