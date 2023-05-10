//
//  Error.swift
//  JuiceMaker
//
//  Created by Yetti, yy-ss99, Mary.
//

enum JuiceMakerError: Error, CustomStringConvertible {
    case ingredientShortage
    case notExistFruit
    
    var description: String {
        switch self {
        case .ingredientShortage:
            return "재료가 모두 소진되었습니다."
        case .notExistFruit:
            return "존재하지 않는 과일입니다."
        }
    }
}
