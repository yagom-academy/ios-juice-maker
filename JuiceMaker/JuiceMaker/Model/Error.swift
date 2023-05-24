//
//  Error.swift
//  JuiceMaker
//
//  Created by Yetti, yy-ss99, Mary.
//

import Foundation

enum JuiceMakerError: LocalizedError {
    case outOfStock(fruit: Fruits)
    case notExistFruit(fruit: Fruits)
    
    var errorDescription: String? {
        switch self {
        case .outOfStock(let fruit):
            return "\(fruit)가(이) 부족합니다."
        case .notExistFruit(let fruit):
            return "\(fruit)를 찾을 수 없습니다."
        }
    }
}
