//
//  JuiceMakerError.swift
//  JuiceMaker
//
//  Created by 이호영 on 2021/10/28.
//

import Foundation

enum FruitError: LocalizedError {
    case notFoundView(AnyObject,String)
    case notFoundID(AnyObject,String)
    case notFoundJuice
    case notFoundFruitCount(AnyObject, String)
    case notFoundFruit
    
    var errorDescription: String? {
        switch self {
        case .notFoundFruitCount(let VC, let viewID):
            return """
                   \(VC)
                   ID(\(viewID))에 해당하는 과일의 갯수를 찾을 수 없습니다.
                   """
        case .notFoundView(let VC, let viewName):
            return """
                    \(VC)
                    StoryBoard의 \(viewName)을 찾을 수 없습니다.
                   """
        case .notFoundID(let VC, let viewID):
            return """
                    \(VC)
                    StoryBoard의 \(viewID)을 찾을 수 없습니다.
                   """
        case .notFoundJuice:
            return "과일 ID에 해당하는 주스 케이스를 찾을 수 없습니다."
        case .notFoundFruit:
            return "과일 ID에 해당하는 과일 케이스를 찾을 수 없습니다."
        }
    }
}
