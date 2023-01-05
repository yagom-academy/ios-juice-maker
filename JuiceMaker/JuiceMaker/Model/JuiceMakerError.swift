//
//  JuiceMakerError.swift
//  JuiceMaker

//  Created by Rhode, Christy on 2023/01/03.
//

enum JuiceMakerError: String, Error {
    case invalidFruit = "목록에 없는 과일입니다."
    case outOfStock = "재고가 부족합니다."
}
