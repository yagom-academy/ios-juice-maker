//
//  Stock.swift
//  JuiceMaker
//
//  Created by soyounglee on 2022/02/15.
//

import Foundation

struct Stock {
  let quantity: Int
  
  init?(_ quantity: Int) {
    guard quantity >= 0 else { return nil }
    
    self.quantity = quantity
  }
}
