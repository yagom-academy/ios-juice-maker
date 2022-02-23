//
//  MakeJuiceError.swift
//  JuiceMaker
//
//  Created by Lingo on 2022/02/23.
//

import Foundation

enum MakeJuiceError: String, Error {
  case outOfStock = "재고가 부족합니다."
  case notExistFruit = "존재하지 않는 과일입니다."
}
