//
//  JuiceMakerError.swift
//  JuiceMaker
//
//  Created by 강경 on 2022/02/16.
//

import Foundation

enum JuiceMakerError: Error, CustomStringConvertible {
    case notEnough
    case notFindReceipe
    case notFindFruit
    case notDecrease
    
    var description: String {
        switch self {
        case .notEnough:
            return "재료가 모자라요. 재고를 수정할까요?"
        case .notFindReceipe:
            return "레시피를 찾을 수 없습니다."
        case .notFindFruit:
            return "과일을 찾을 수 없습니다."
        case .notDecrease:
            return "더이상 감소할 수 없습니다."
        }
    }
}
