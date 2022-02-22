//
//  JuiceMakerError.swift
//  JuiceMaker
//
//  Created by 김태현 on 2022/02/22.
//

import Foundation

enum JuiceMakerError: Error {
    case notFoundFruit
    case notEnoughFruitAmount(fruit: String)
}

extension JuiceMakerError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .notFoundFruit:
            return "과일을 찾을 수 없습니다."
        case .notEnoughFruitAmount(let fruit):
            return "\(fruit)의 양이 부족합니다. 다시 주문해주세요."
        }
    }
}
