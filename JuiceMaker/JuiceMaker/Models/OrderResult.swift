//
//  OrderResult.swift
//  JuiceMaker
//
//  Created by 강경 on 2021/03/18.
//

import Foundation

class OrderResult {
  var message: String
  var isSuccessed: Bool
  
  init(message: String, isSuccessed: Bool) {
    self.isSuccessed = isSuccessed
    self.message = message
  }
}
