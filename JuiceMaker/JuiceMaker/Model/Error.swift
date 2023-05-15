//
//  Error.swift
//  JuiceMaker
//
//  Created by Yetti, yy-ss99, Mary.
//

enum JuiceMakerError: Error, CustomStringConvertible {
    case outOfStock(fruit: Fruits)
    case notExistFruit(fruit: Fruits)
    
    var description: String {
        switch self {
        case .outOfStock(let fruit):
            return "\(fruit)가(이) 부족합니다."
        case .notExistFruit(let fruit):
            return "\(fruit)를 찾을 수 없습니다."
        }
    }
}
