//
//  JucieMakerError.swift
//  JuiceMaker
//
//  Created by dasan & kyungmin on 2023/05/25.
//

enum JuiceMakerError: Error, CustomStringConvertible {
    case outOfFruitStock
    case unknownError
    
    var description: String {
        switch self {
        case .outOfFruitStock:
            return "재료가 모자라요."
        case .unknownError:
            return "알 수 없는 오류입니다."
        }
    }
}
