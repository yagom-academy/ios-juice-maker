//
//  Error.swift
//  JuiceMaker
//
//  Created by Yetti, yy-ss99, Mary.
//

enum BuyError: Error, CustomStringConvertible {
    case ingredientShortage
    case unknown
    
    var description: String {
        switch self {
        case .ingredientShortage:
            return "재료가 모두 소진되었습니다."
        case .unknown:
            return "알 수 없는 에러입니다."
        }
    }
}
