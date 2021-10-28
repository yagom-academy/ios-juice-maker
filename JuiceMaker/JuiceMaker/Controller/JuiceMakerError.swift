//
//  JuiceMakerError.swift
//  JuiceMaker
//
//  Created by 이호영 on 2021/10/28.
//

import Foundation

enum FruitError: LocalizedError {
    case notFoundID(AnyObject,String)
    case notFoundJuice
    case notFoundFruitCount
    case notFoundFruit
    
    var errorDescription: String? {
        switch self {
        case .notFoundFruitCount:
            return "과일의 갯수를 찾을 수 없습니다."
        case .notFoundID(let VC,let viewName):
            return "\(VC)가 접근하려는 StoryBoard의 \(viewName) 속성 요소에 ID가 지정되지 않았습니다."
        case .notFoundJuice:
            return "과일 ID에 해당하는 주스 케이스를 찾을 수 없습니다."
        case .notFoundFruit:
            return "과일 ID에 해당하는 과일 케이스를 찾을 수 없습니다."
        }
    }
}
